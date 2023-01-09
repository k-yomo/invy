import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfo {
  DeviceInfo(this.osVersion, this.manufacturer, this.model);

  final String osVersion;
  final String manufacturer;
  final String model;
}

Future<DeviceInfo> getDeviceInfo() async {
  if (Platform.isIOS) {
    final iosInfo = await DeviceInfoPlugin().iosInfo;
    return DeviceInfo(iosInfo.systemVersion ?? "", "Apple", iosInfo.name ?? "");
  } else {
    // it must be Android if not iOS
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    return DeviceInfo(androidInfo.version.release, androidInfo.manufacturer,
        androidInfo.model);
  }
}
