import 'package:http/http.dart';
export 'package:http/http.dart' show MultipartFile;

MultipartFile fileFromJson(dynamic data) {
  return data as MultipartFile;
}

dynamic fileToJson(MultipartFile data) {
  return data;
}
