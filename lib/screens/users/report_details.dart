import 'package:alerto_cdo_v1/blocs/application_bloc.dart';
import 'package:alerto_cdo_v1/screens/mapscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../loading.dart';

class MyReportsDetails extends StatelessWidget {
  final String? details;
  final String? img;
  final String? rep_status;
  final String? type;
  final String? contact;
  final double? latitude;
  final double? longitude;
  final String? docid;
  final String? date;
  const MyReportsDetails(
      {Key? key,
      required this.docid,
      required this.latitude,
      required this.longitude,
      required this.contact,
      required this.details,
      required this.img,
      required this.type,
      required this.rep_status,
      required this.date})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: Text('REPORT DETAILS'),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => ApplicationBloc(),
        child: Container(
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage("assets/buttons/MAIN BG.png"),
          //         fit: BoxFit.cover)),
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
              secondRow(),
              fourthRow(),
            ],
          ),
        ),
      ),
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

            List<Marker> allMarkers = [];
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
                                          newContext,
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
            child: Text(date!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                )),
          )
        ],
      );

  Widget status() => Row(
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
              padding: const EdgeInsets.fromLTRB(35, 30, 10, 5),
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
        ],
      );

  Widget secondRow() => Row(
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
              child: SingleChildScrollView(child: Text(details!)),
            ),
          )
        ],
      );

  Widget fourthRow() => Row(
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
            padding: const EdgeInsets.fromLTRB(35, 10, 10, 25),
            child: Container(
                height: 300,
                width: 270,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Image.network(
                  img!,
                  fit: BoxFit.fill,
                )),
          )
        ],
      );
}
