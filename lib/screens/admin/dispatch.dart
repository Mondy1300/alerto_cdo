import 'package:alerto_cdo_v1/blocs/application_bloc.dart';
import 'package:alerto_cdo_v1/screens/admin/units.dart';
import 'package:alerto_cdo_v1/screens/mapscreen.dart';
import 'package:alerto_cdo_v1/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../loading.dart';

class DispatchScreen extends StatelessWidget {
  final double? latitude;
  final double? longitude;
  final String? details;
  final String? docID;

  const DispatchScreen(
      {Key? key,
      required this.docID,
      required this.latitude,
      required this.longitude,
      required this.details})
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
                'DISPATCH UNITS',
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
        child: DispatchScreenBody(
          docID: docID,
          details: details,
          latitude: latitude,
          longitude: longitude,
        ),
      ),
    );
  }
}

class DispatchScreenBody extends StatefulWidget {
  final double? latitude;
  final double? longitude;
  final String? details;
  final String? docID;

  const DispatchScreenBody(
      {Key? key,
      required this.docID,
      required this.details,
      required this.latitude,
      required this.longitude})
      : super(key: key);

  @override
  _DispatchScreenBodyState createState() => _DispatchScreenBodyState(
        docID: docID,
        latitude: latitude,
        longitude: longitude,
        details: details,
      );
}

class _DispatchScreenBodyState extends State<DispatchScreenBody> {
  final double? latitude;
  final double? longitude;
  final String? details;
  final String? docID;
  _DispatchScreenBodyState(
      {required this.details,
      required this.latitude,
      required this.longitude,
      required this.docID});
  String dropdownvalue = 'UNIT 1';
  String dropdownvalue2 = 'FIRE';
  var items = ['UNIT 1', 'UNIT 2', 'UNIT 3', 'UNIT 4', 'UNIT 5'];
  var items2 = ['CAR CRASH', 'FIRE', 'FLOOD'];

  final int all_units = 15;

  int? avail = 15;
  int? dispatch = 0;

  List<Marker> marker = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
              color: Color(0xffBA0F30),
              width: 400,
              height: 150,
              child: Units()),
          firstRow(context),
          // secRow(context),
          locRow(marker),
          detailsRow(details),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(top: 40, right: 40),
              //   child: SizedBox(
              //     height: 50,
              //     width: 150,
              //     child: ElevatedButton.icon(
              //       label: Text(
              //         'GOODS',
              //         style: TextStyle(
              //           fontSize: 18,
              //         ),
              //       ),
              //       onPressed: () {
              //         showDialog(
              //           context: context,
              //           builder: (BuildContext context) =>
              //               popUpDialog_clear(context),
              //         );
              //       },
              //       icon: Icon(Icons.check),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 20),
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton.icon(
                    label: Text(
                      'CONFIRM',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      String rep_status = 'DISPATCHED';
                      var collection =
                          FirebaseFirestore.instance.collection('reports');
                      collection.doc(docID).update({'status': rep_status});
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => popUpDialog(context),
                      );
                    },
                    icon: Icon(Icons.check),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget popUpDialog_clear(BuildContext context) {
  //   return AlertDialog(
  //     backgroundColor: Color(0xffBA0F30),
  //     contentTextStyle: TextStyle(
  //       color: Colors.white,
  //       fontSize: 16,
  //     ),
  //     title: Text(
  //       'ALL GOODS!',
  //       style: TextStyle(color: Colors.white),
  //     ),
  //     content: new Column(
  //       mainAxisSize: MainAxisSize.min,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Text('Thank you!'),
  //       ],
  //     ),
  //     actions: [
  //       TextButton(
  //           style: ButtonStyle(
  //             foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
  //             backgroundColor:
  //                 MaterialStateProperty.all<Color>(Colors.blueGrey),
  //           ),
  //           onPressed: () {
  //             setState(() {
  //               if (dispatch == 0) {
  //                 if (avail == 15) {
  //                   dispatch = this.dispatch;
  //                   avail = this.avail;
  //                 }
  //               } else {
  //                 avail += 1;
  //                 dispatch -= 1;
  //               }
  //             });
  //             Navigator.pop(context);
  //           },
  //           child: Text('OK'))
  //     ],
  //   );
  // }

  Widget popUpDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xffBA0F30),
      contentTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      title: Text(
        'UNIT DISPATCHED!',
        style: TextStyle(color: Colors.white),
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Notification has been succesfully sent to sender'),
        ],
      ),
      actions: [
        TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.blueGrey),
            ),
            onPressed: () async {
              DocumentSnapshot variable = await FirebaseFirestore.instance
                  .collection('units')
                  .doc('110011')
                  .get();

              int? val_dispatch;
              int? val_avail;
              setState(() {
                if (avail == 0) {
                  if (dispatch == 15) {
                    val_avail = avail;
                    val_dispatch = dispatch;
                    DatabaseService().dispatchUnits(val_avail, val_dispatch);
                  }
                } else {
                  avail = variable.get('available');
                  dispatch = variable.get('dispatched');
                  int? avail_set = avail! - 1;
                  int? dispatch_set = dispatch! + 1;
                  print(avail);
                  DatabaseService().dispatchUnits(avail_set, dispatch_set);
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                }
              });

              Navigator.pop(context);
            },
            child: Text('OK'))
      ],
    );
  }

  Widget firstRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Container(
            child: Text(
              'Unit:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50, top: 20),
          child: Container(
            child: SizedBox(
              width: 100,
              height: 50,
              child: DropdownButton(
                value: dropdownvalue,
                icon: Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                  return DropdownMenuItem<String>(
                      value: items,
                      child: Text(
                        items,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget secRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Container(
            child: Text(
              'Type:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 43, top: 20),
          child: Container(
            child: SizedBox(
              width: 120,
              height: 50,
              child: DropdownButton(
                value: dropdownvalue2,
                icon: Icon(Icons.keyboard_arrow_down),
                items: items2.map((String items2) {
                  return DropdownMenuItem<String>(
                      value: items2,
                      child: Text(
                        items2,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ));
                }).toList(),
                onChanged: (String? newValue2) {
                  setState(() {
                    dropdownvalue2 = newValue2!;
                  });
                },
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget lowerRow() => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 53, right: 20, top: 5),
            child: Text(
              'ALL UNITS',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 33, right: 20, top: 5),
            child: Text(
              'AVAILABLE\nUNITS',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 10, top: 5),
            child: Text(
              'DISPATCHED\nUNITS',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          )
        ],
      );

  Widget locRow(List<Marker> allMarkers) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
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

  Widget detailsRow(String? value) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: Container(
              child: Text('Details:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 10, 5),
            child: Container(
              padding: EdgeInsets.all(5),
              height: 100,
              width: 270,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: SingleChildScrollView(child: Text(value!)),
            ),
          )
        ],
      );
}
