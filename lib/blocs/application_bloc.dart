import 'package:alerto_cdo_v1/services/geolocator_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class ApplicationBloc with ChangeNotifier {
  final geoLocatorService = GeolocatorService();

  //variables
  Position? currenLocation;

  ApplicationBloc() {
    setCurrentLocation();
  }

  setCurrentLocation() async {
    currenLocation = await geoLocatorService.getCurrentLocation();
    notifyListeners();
  }
}
