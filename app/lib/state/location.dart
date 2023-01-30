import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

final locationNameProvider = StateProvider<String>((ref) {
  return "";
});

final invitationLocationProvider = StateProvider<LatLng>((ref) {
  return const LatLng(35.6585663, 139.6980641);
});

Future<LatLng?> getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return null;
  }

  final locationWhenInUseStatus = await Permission.locationWhenInUse.status;
  if (locationWhenInUseStatus.isDenied) {
    await Permission.locationWhenInUse.request();
  }

  if (locationWhenInUseStatus.isGranted &&
      await Permission.locationAlways.isDenied) {
    await Permission.locationAlways.request();
  }

  final location = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  return LatLng(location.latitude, location.longitude);
}
