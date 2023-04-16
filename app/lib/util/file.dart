import 'package:image_picker/image_picker.dart';
import 'package:invy/graphql/scalars.dart';
import 'package:mime/mime.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

Future<MultipartFile> convertToMultipartFile(XFile file) async {
  var byteData = await file.readAsBytes();
  return MultipartFile.fromBytes(
    file.path.split('/').last,
    byteData,
    contentType: MediaType.parse(lookupMimeType(file.path)!),
  );
}
