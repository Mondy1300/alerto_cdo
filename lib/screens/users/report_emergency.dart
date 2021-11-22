import 'dart:io';

import 'package:alerto_cdo_v1/blocs/application_bloc.dart';
import 'package:alerto_cdo_v1/loading.dart';
import 'package:alerto_cdo_v1/model/user.dart';
import 'package:alerto_cdo_v1/screens/mapscreen.dart';
import 'package:alerto_cdo_v1/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ReportEmergency extends StatelessWidget {
  const ReportEmergency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                'REPORT EMERGENCY',
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Image.asset(
                  'assets/logo3.png',
                  fit: BoxFit.contain,
                  height: 50,
                ),
              ),
            )
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: ChangeNotifierProvider(
          create: (context) => ApplicationBloc(), child: ReportScreen()),
    );
  }
}

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  var items = ['CAR CRASH', 'FIRE', 'FLOOD'];
  String? value;

  final desController = TextEditingController();
  String? txtvalue;
  String? userid;
  String? first;
  String? middle;
  String? last;
  List? name = [];
  String? contactnum;
  File? _image;
  String? imageUrl;
  String emer_type = 'FIRE';
  List<Marker> allMarkers = [];

  Future getImage(ImageSource source) async {
    final image =
        await ImagePicker().getImage(source: source, imageQuality: 10);

    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    userid = auth.currentUser!.uid;

    double? currentLat;
    double? currentLong;

    return Container(
      child: StreamBuilder<UserData>(
          stream: DatabaseService(uid: userid).userData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              UserData? userData = snapshot.data;
              return ListView(children: [
                Column(
                  children: [
                    Container(
                      color: Color(0xffBA0F30),
                      child: SizedBox(
                        width: 400,
                        height: 104,
                        child: InputDecorator(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 50.0, vertical: 20),
                            labelText: 'SELECT EMERGENCY',
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          child: DropdownButton<String>(
                            value: emer_type,
                            dropdownColor: Color(0xffBA0F30),
                            items: <String>['CAR CRASH', 'FIRE', 'FLOOD']
                                .map(builMenuItem)
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                emer_type = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'MAP',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Builder(builder: (BuildContext newContext) {
                      final applicationBloc =
                          Provider.of<ApplicationBloc>(newContext);
                      currentLat = applicationBloc.currenLocation!.latitude;
                      currentLong = applicationBloc.currenLocation!.longitude;

                      allMarkers.add(Marker(
                          markerId: MarkerId('myMarker'),
                          draggable: true,
                          onTap: () {
                            print('Marker Tapped');
                          },
                          position: LatLng(currentLat!, currentLong!)));

                      return (applicationBloc == null)
                          ? Container(child: CircularProgressIndicator())
                          : (applicationBloc.currenLocation == null)
                              ? Loading()
                              : Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 20, 20, 20),
                                  child: Container(
                                    child: Stack(children: [
                                      GoogleMap(
                                          markers: Set.from(allMarkers),
                                          mapType: MapType.normal,
                                          myLocationButtonEnabled: true,
                                          initialCameraPosition: CameraPosition(
                                              tilt: 45,
                                              zoom: 15,
                                              target: LatLng(
                                                  currentLat!, currentLong!))),
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    new MaterialPageRoute(
                                                        builder: (context) =>
                                                            MapScreen(
                                                                latitude:
                                                                    currentLat,
                                                                longitude:
                                                                    currentLong)));
                                              },
                                              child: Icon(
                                                Icons.aspect_ratio,
                                                size: 30,
                                                color: Colors.red,
                                              ),
                                            ),
                                          )),
                                    ]),
                                    height: 300,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black)),
                                  ),
                                );
                    }),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'DESCRIPTION',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      child: Container(
                        height: 150,
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: "Enter Description . . .",
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 5.0),
                          ),
                          controller: desController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                      ),
                    ),
                    FloatingActionButton.extended(
                      icon: Icon(Icons.image),
                      onPressed: () {
                        _onButtonPressed();
                        // getImage();
                      },
                      label: Text('Upload Image'),
                    ),
                    Container(
                        height: 450,
                        width: 550,
                        margin: EdgeInsets.only(top: 20),
                        child: Center(
                          child: _image == null
                              ? Text("Image not loaded")
                              : Container(
                                  child: Image(image: FileImage(_image!))),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 50, 8, 8),
                          child: SizedBox(
                            height: 45,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              label: Text(
                                'VOICE CALL',
                                style: TextStyle(fontSize: 18),
                              ),
                              icon: Icon(Icons.call),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.blueGrey),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 50, 8, 8),
                          child: SizedBox(
                            height: 45,
                            child: ElevatedButton.icon(
                              label: Text(
                                'SUBMIT',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              onPressed: () async {
                                txtvalue = desController.toString();
                                print(desController.text);
                                first = userData!.firstname;
                                middle = userData.middlename;
                                last = userData.lastname;
                                contactnum = userData.contactNum;
                                name!.add(first);
                                name!.add(middle);
                                name!.add(last);
                                DateTime phonetime = DateTime.now();

                                final ref = FirebaseStorage.instance
                                    .ref()
                                    .child("report_images")
                                    .child(phonetime.toString() + '.jpg');
                                await ref.putFile(_image!);

                                imageUrl = await ref.getDownloadURL();
                                final DateTime now = DateTime.now();
                                final DateFormat formatter =
                                    DateFormat("yyyy-MM-dd hh:mm");
                                final String formatted = formatter.format(now);

                                DatabaseService().createReport(
                                    desController.text,
                                    userid,
                                    name,
                                    contactnum,
                                    imageUrl,
                                    emer_type,
                                    currentLat,
                                    currentLong,
                                    formatted.toString(),
                                    '');
                                // print(txtvalue);

                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      popUpDialog(context),
                                );
                              },
                              icon: Icon(Icons.check),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ]);
            } else {
              return Loading();
            }
          }),
    );
  }

  DropdownMenuItem<String> builMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      );

  Widget popUpDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xffBA0F30),
      contentTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      title: Text(
        'REPORT SUCCESFULLY SENT',
        style: TextStyle(color: Colors.white),
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Please wait for Confirmation'),
        ],
      ),
      actions: [
        TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.blueGrey),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: Text('OK'))
      ],
    );
  }

  void _onButtonPressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            height: 130,
            child: Container(
              child: _buildBottomSheet(),
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20),
                    topRight: const Radius.circular(20),
                  )),
            ),
          );
        });
  }

  Column _buildBottomSheet() {
    return Column(
      children: [
        ListTile(
            leading: Icon(Icons.camera),
            title: Text("Camera"),
            onTap: () {
              getImage(ImageSource.camera);
              Navigator.pop(context);
            }),
        ListTile(
            leading: Icon(Icons.photo_album),
            title: Text("Gallery"),
            onTap: () {
              getImage(ImageSource.gallery);
              Navigator.pop(context);
            }),
      ],
    );
  }
}
