import 'package:alerto_cdo_v1/blocs/application_bloc.dart';
import 'package:alerto_cdo_v1/model/report.dart';
import 'package:alerto_cdo_v1/screens/admin/dispatch.dart';
import 'package:alerto_cdo_v1/screens/mapscreen.dart';
import 'package:alerto_cdo_v1/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../loading.dart';

class ViewReportScreen extends StatelessWidget {
  final String? details;
  final String? img;
  final String? sender;
  final String? type;
  final String? contact;
  final double? latitude;
  final double? longitude;
  final String? docid;
  final String? rep_status;
  final String? date_time;
  const ViewReportScreen(
      {Key? key,
      required this.docid,
      required this.latitude,
      required this.longitude,
      required this.contact,
      required this.details,
      required this.img,
      required this.sender,
      required this.type,
      required this.rep_status,
      required this.date_time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text(
                'REPORT DETAILS',
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 40),
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
        create: (context) => ApplicationBloc(),
        child: ViewReportBody(
          rep_status: rep_status,
          docid: docid,
          latitude: latitude,
          longitude: longitude,
          contact: contact,
          details: details,
          img: img,
          sender: sender,
          type: type,
          date_time: date_time,
        ),
      ),
    );
  }
}

class ViewReportBody extends StatefulWidget {
  final String? details;
  final String? img;
  final String? sender;
  final String? type;
  final String? contact;
  final double? latitude;
  final double? longitude;
  final String? docid;
  final String? rep_status;
  final String? date_time;

  const ViewReportBody(
      {Key? key,
      required this.rep_status,
      required this.latitude,
      required this.longitude,
      required this.contact,
      required this.details,
      required this.img,
      required this.sender,
      required this.type,
      required this.docid,
      required this.date_time})
      : super(key: key);

  @override
  _ViewReportBodyState createState() => _ViewReportBodyState(
        rep_status: rep_status,
        docid: docid,
        latitude: latitude,
        longitude: longitude,
        details: details,
        img: img,
        sender: sender,
        type: type,
        contact: contact,
        date_time: date_time,
      );
}

class _ViewReportBodyState extends State<ViewReportBody> {
  final String? details;
  final String? img;
  final String? sender;
  final String? type;
  final String? contact;
  final double? latitude;
  final double? longitude;
  final String? docid;
  String? rep_status;
  final String? date_time;
  _ViewReportBodyState(
      {required this.latitude,
      required this.longitude,
      required this.contact,
      required this.details,
      required this.img,
      required this.sender,
      required this.type,
      required this.docid,
      required this.rep_status,
      required this.date_time});

  List<Marker> allMarkers = [];
  int? avail = 15;
  int? dispatch = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
              color: Color(0xffBA0F30),
              child: SizedBox(
                width: 400,
                height: 80,
                child: Center(
                  child: Text(
                    '$type EMERGENCY',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              )),
          status(),
          dateTime(),
          firstRow(),
          secondRow(details),
          thirdRow(sender),
          thirdRowv2(contact),
          fourthRow(img),
          buttons(context),
        ],
      ),
    );
  }

  Widget dateTime() => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30),
            child: Container(
              child: Text('Date:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 30, 10, 5),
            child: Text(date_time!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                )),
          )
        ],
      );

  Widget status() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 30),
          child: Container(
            child: Text('Status:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(35, 35, 10, 5),
            child: Text(rep_status!,
                style: (rep_status == 'DISPATCHED')
                    ? TextStyle(
                        fontSize: 22,
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold)
                    : (rep_status == 'RESOLVED')
                        ? TextStyle(
                            fontSize: 22,
                            color: Colors.green,
                            fontWeight: FontWeight.bold)
                        : TextStyle(
                            fontSize: 22,
                            color: Colors.red,
                            fontWeight: FontWeight.bold))),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 25),
          child: SizedBox(
            height: 35,
            width: 120,
            child: ElevatedButton(
              onPressed: (rep_status == 'DISPATCHED')
                  ? () async {
                      String resolved = "RESOLVED";
                      var collection =
                          FirebaseFirestore.instance.collection('reports');

                      collection.doc(docid).update({'status': resolved});

                      DocumentSnapshot variable = await FirebaseFirestore
                          .instance
                          .collection('units')
                          .doc('110011')
                          .get();

                      DocumentSnapshot docSnap =
                          await collection.doc(docid).get();

                      String stream_status = docSnap.get('status');

                      int? val_dispatch;
                      int? val_avail;
                      setState(() {
                        if (dispatch == 0) {
                          if (avail == 15) {
                            val_avail = avail;
                            val_dispatch = dispatch;
                            DatabaseService()
                                .dispatchUnits(val_avail, val_dispatch);
                          }
                        } else {
                          avail = variable.get('available');
                          dispatch = variable.get('dispatched');
                          int? avail_set = avail! + 1;
                          int? dispatch_set = dispatch! - 1;
                          print(avail);
                          DatabaseService()
                              .dispatchUnits(avail_set, dispatch_set);
                        }
                        rep_status = stream_status;
                      });
                    }
                  : () {},
              child: Text("RESOLVE"),
            ),
          ),
        )
      ],
    );
  }

  Widget firstRow() => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              child: Text('Location:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          Builder(builder: (BuildContext newContext) {
            final applicationBloc = Provider.of<ApplicationBloc>(newContext);

            allMarkers.add(Marker(
                markerId: MarkerId('myMarker'),
                draggable: true,
                onTap: () {
                  print('Marker Tapped');
                },
                position: LatLng(latitude!, longitude!)));

            return (applicationBloc == null)
                ? Container(child: CircularProgressIndicator())
                : (applicationBloc.currenLocation == null)
                    ? Loading()
                    : Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                        child: Container(
                          child: Stack(children: [
                            GoogleMap(
                                markers: Set.from(allMarkers),
                                mapType: MapType.normal,
                                myLocationButtonEnabled: true,
                                initialCameraPosition: CameraPosition(
                                    zoom: 16,
                                    target: LatLng(latitude!, longitude!))),
                            Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          new MaterialPageRoute(
                                              builder: (context) => MapScreen(
                                                  latitude: latitude,
                                                  longitude: longitude)));
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
                          width: 270,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                        ),
                      );
          }),
        ],
      );
  Widget secondRow(String? values) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              child: Text('Details:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 10, 5),
            child: Container(
              padding: EdgeInsets.all(5),
              height: 100,
              width: 270,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: SingleChildScrollView(child: Text(values!)),
            ),
          )
        ],
      );

  Widget thirdRow(String? name) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 8),
            child: Container(
              child: Text('Sender:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 15, 10, 5),
            child: Text(
              name!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );

  Widget thirdRowv2(String? contact_num) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(105, 5, 10, 5),
            child: Text(
              contact_num!,
              style: TextStyle(
                fontSize: 18,
                decoration: TextDecoration.underline,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      );

  Widget fourthRow(String? imgUrl) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              child: Text('Image:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(35, 10, 10, 5),
            child: Container(
                height: 300,
                width: 270,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Image.network(
                  imgUrl!,
                  fit: BoxFit.fill,
                )),
          )
        ],
      );

  Widget buttons(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 50, 8, 8),
            child: SizedBox(
              height: 45,
              child: ElevatedButton.icon(
                onPressed: () {
                  callNumber();
                },
                label: Text(
                  'CALL SENDER',
                  style: TextStyle(fontSize: 18),
                ),
                icon: Icon(Icons.call),
                style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 50, 8, 8),
            child: SizedBox(
              height: 45,
              child: ElevatedButton.icon(
                label: Text(
                  'CONFIRM',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onPressed: (rep_status == 'WAITING')
                    ? () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              popUpDialog(context),
                        );
                      }
                    : () {},
                icon: Icon(Icons.check),
              ),
            ),
          )
        ],
      );

  callNumber() async {
    String? number = contact;
    bool? res = await FlutterPhoneDirectCaller.callNumber(number!);
  }

  Widget popUpDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xffBA0F30),
      contentTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      title: Text(
        'REPORT CONFIRMED',
        style: TextStyle(color: Colors.white),
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Please proceed to Dispatch Units'),
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
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new DispatchScreen(
                            docID: docid,
                            details: details,
                            latitude: latitude,
                            longitude: longitude,
                          )));
            },
            child: Text('DISPATCH'))
      ],
    );
  }
}
