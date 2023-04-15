import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';

LatLng getRandomLocation(LatLng point, int radius) {
  final x0 = point.latitude;
  final y0 = point.longitude;

  Random random = Random();

  // Convert radius from meters to degrees
  final radiusInDegrees = radius / 111000;

  final u = random.nextDouble();
  final v = random.nextDouble();
  final w = radiusInDegrees * sqrt(u);
  final t = 2 * pi * v;
  final x = w * cos(t);
  final y = w * sin(t);

  // Adjust the x-coordinate for the shrinking of the east-west distances
  final newX = x / cos(y0);

  final foundLatitude = newX + x0;
  final foundLongitude = y + y0;
  return LatLng(foundLatitude, foundLongitude);
}
