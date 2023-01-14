import 'package:dio/dio.dart';
export 'package:dio/dio.dart' show MultipartFile;

MultipartFile fileFromJson(dynamic data) {
  return data as MultipartFile;
}

dynamic fileToJson(MultipartFile data) {
  return data;
}
