import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_udid/flutter_udid.dart';

class DeviceInfo {
  DeviceInfo({
    required this.osVersion,
    required this.manufacturer,
    required this.model,
    required this.deviceId,
  });

  final String osVersion;
  final String manufacturer;
  final String model;
  final String deviceId;
}

Future<DeviceInfo> getDeviceInfo() async {
  String deviceId = await FlutterUdid.consistentUdid;
  if (Platform.isIOS) {
    final iosInfo = await DeviceInfoPlugin().iosInfo;
    return DeviceInfo(
      osVersion: iosInfo.systemVersion ?? "",
      manufacturer: "Apple",
      model: iosInfo.name ?? "",
      deviceId: deviceId,
    );
  } else {
    // it must be Android if not iOS
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    return DeviceInfo(
      osVersion: androidInfo.version.release!,
      manufacturer: androidInfo.manufacturer,
      model: androidInfo.model,
      deviceId: deviceId,
    );
  }
}
