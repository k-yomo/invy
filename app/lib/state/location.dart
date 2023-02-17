import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

final locationNameProvider = StateProvider<String>((ref) {
  return "";
});

final currentPinLocationProvider = StateProvider<LatLng?>((ref) {
  return null;
});

final invitationLocationProvider = StateProvider<LatLng?>((ref) {
  return null;
});

Future<LatLng?> getCurrentLocation() async {
  if (!await Geolocator.isLocationServiceEnabled()) {
    return null;
  }

  var locationWhenInUseStatus = await Permission.locationWhenInUse.status;
  if (locationWhenInUseStatus.isDenied) {
    locationWhenInUseStatus = await Permission.locationWhenInUse.request();
  }

  if (locationWhenInUseStatus.isGranted &&
      await Permission.locationAlways.isDenied) {
    await Permission.locationAlways.request();
  }

  try {
    final location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return LatLng(location.latitude, location.longitude);
  } catch (e) {
    return null;
  }
}
