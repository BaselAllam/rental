import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';


class MapController with ChangeNotifier, DiagnosticableTreeMixin {


  LatLng locationValue = LatLng(30.033333, 31.233334);

  void searchOnMap(String searchedValue) async {

    await checkPermission();

    List<Location> location = await locationFromAddress(searchedValue);

    locationValue = LatLng(location[0].latitude, location[0].longitude);
    print(locationValue.latitude);
    notifyListeners();
  }

  void getUserLocation() async {

    await checkPermission();

    Position userPosition = await Geolocator.getCurrentPosition();
    locationValue = LatLng(userPosition.latitude, userPosition.longitude);
    notifyListeners();
  }

  Future<void> checkPermission() async {

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }
  }


  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('', 0));
  }

}