import 'package:alerto_cdo_v1/loading.dart';
import 'package:alerto_cdo_v1/screens/users/report_emergency.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class AdminMapScreen extends StatefulWidget {
  const AdminMapScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AdminMapScreen> createState() => _AdminMapScreenState();
}

class _AdminMapScreenState extends State<AdminMapScreen> {
  GoogleMapController? _controller;
  // Iterable markers = [];

  @override
  void initState() {
    super.initState();
    customMarker();
  }

  BitmapDescriptor? fireMarker;
  BitmapDescriptor? floodMarker;
  BitmapDescriptor? earthquakeMarker;
  BitmapDescriptor? carCrashMarker;
  BitmapDescriptor? landslideMarker;
  BitmapDescriptor? othersMarker;

  void customMarker() async {
    fireMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/markers/fire.png');
    floodMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/markers/flood.png');
    earthquakeMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/markers/earthquake.png');
    carCrashMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/markers/car_crash.png');
    landslideMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/markers/landslide.png');
    othersMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/markers/tsunami.png');
  }

  @override
  Widget build(BuildContext context) {
    var stats = ['RESOLVED', 'DISREGARD'];
    return Scaffold(
      appBar: AppBar(
        title: Text('ADMIN MAP'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('reports')
            .where('status', isNotEqualTo: 'RESOLVED')
            .snapshots(),
        builder: buildMap,
      ),
      //AdminMapBody(),
    );
  }

  Widget buildMap(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasData) {
      Iterable markers = [];

      Iterable _markers =
          Iterable.generate(snapshot.data!.docs.length, (index) {
        DocumentSnapshot report = snapshot.data!.docs[index];
        return Marker(
            markerId: MarkerId(report['userid']),
            position: LatLng(report['latitude'], report['longitude']),
            infoWindow: InfoWindow(
                title: report['emergency type'], snippet: report['status']),
            icon: (report['emergency type'] == 'FIRE')
                ? fireMarker!
                : (report['emergency type'] == 'FLOOD')
                    ? floodMarker!
                    : (report['emergency type'] == 'EARTHQUAKE')
                        ? earthquakeMarker!
                        : (report['emergency type'] == 'CAR CRASH')
                            ? carCrashMarker!
                            : (report['emergency type'] == 'LANDSLIDE')
                                ? landslideMarker!
                                : othersMarker!);
      });

      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(8.4542, 124.6319),
            zoom: 11.0,
            tilt: 45,
          ),
          markers: Set.from(_markers),
        ),
      );
    } else if (snapshot.connectionState == ConnectionState.done &&
        !snapshot.hasData) {
      return Center(
        child: Text("No data found."),
      );
    } else {
      return Loading();
    }
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }
}
