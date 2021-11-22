import 'package:alerto_cdo_v1/screens/users/report_emergency.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  final double? latitude;
  final double? longitude;
  const MapScreen({Key? key, required this.latitude, required this.longitude})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MAP'),
      ),
      body: MapBody(
        latitude: latitude,
        longitude: longitude,
      ),
    );
  }
}

class MapBody extends StatefulWidget {
  final double? latitude;
  final double? longitude;
  const MapBody({Key? key, required this.latitude, required this.longitude})
      : super(key: key);

  @override
  _MapBodyState createState() => _MapBodyState(
        latitude: latitude,
        longitude: longitude,
      );
}

class _MapBodyState extends State<MapBody> {
  final double? latitude;
  final double? longitude;
  _MapBodyState({required this.latitude, required this.longitude});

  List<Marker> allMarkers = [];
  GoogleMapController? _controller;

  double? lat_val;
  double? long_val;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allMarkers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: true,
        onDragEnd: ((newPos) {
          setState(() {
            lat_val = newPos.latitude;
            long_val = newPos.longitude;
            print(lat_val);
            print(long_val);
          });
        }),
        onTap: () {
          print('Marker Tapped');
        },
        position: LatLng(latitude!, longitude!)));
  }

  Widget build(BuildContext context) {
    lat_val = latitude!;
    long_val = longitude!;
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(lat_val!, long_val!),
          zoom: 14.0,
          tilt: 45,
        ),
        markers: Set.from(allMarkers),
      ),
    );
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }
}
