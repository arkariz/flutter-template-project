// ignore_for_file: non_constant_identifier_names, always_specify_types
part of 'base_request.dart';

Future<dynamic> MultipartRequest(
  Dio? dio, {
  required String url,
  required JSON headers,
  required JSON data,
  required ContentType contentType,
  bool isReturnJson = true,
  String field = '',
  String filePath = '',
  List<int> fileBytes = const [],
}) async {
  FormData formData = FormData.fromMap(data);

  final defaultFileInfo = _getDefaultFileInfo(contentType);

  if (fileBytes.isNotEmpty) {
    formData.files.add(MapEntry(
        field,
        MultipartFile.fromBytes(
          fileBytes,
          filename: defaultFileInfo['filename'],
          contentType: defaultFileInfo['contentType'],
        )));
  } else if (filePath.isNotEmpty) {
    String fileName = filePath.split('/').last;
    String fileExtention = fileName.split('.').last;
    String? mime = lookupMimeType(filePath);
    formData.files.add(MapEntry(
      field,
      MultipartFile.fromFileSync(
        filePath,
        filename: fileName,
        contentType: MediaType('$mime', '$fileExtention'),
      ),
    ));
  }

  final response = await dio!.post(
    url,
    data: formData,
    options: Options(
        headers: headers,
        responseType: isReturnJson ? ResponseType.json : ResponseType.bytes),
  );

  return response.data;
}

Map<String, dynamic> _getDefaultFileInfo(ContentType contentType) {
  switch (contentType) {
    case ContentType.video:
      return {
        'filename': 'video.mp4',
        'contentType': MediaType('video', 'mp4'),
      };
    case ContentType.json:
      return {
        'filename': 'file.json',
        'contentType': MediaType('application', 'json'),
      };
    case ContentType.audio:
      return {
        'filename': 'audio.mp3',
        'contentType': MediaType('audio', 'mpeg'),
      };
    case ContentType.pdf:
      return {
        'filename': 'document.pdf',
        'contentType': MediaType('application', 'pdf'),
      };
    case ContentType.other:
      return {
        'filename': 'file.bin',
        'contentType': MediaType('application', 'octet-stream'),
      };
    case ContentType.image:
    default:
      return {
        'filename': 'image.png',
        'contentType': MediaType('image', 'jpeg'),
      };
  }
}
