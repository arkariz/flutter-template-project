// ignore_for_file: non_constant_identifier_names, always_specify_types
part of 'base_request.dart';

Future<dynamic> PostRequest(
  Dio? dio, {
  bool isReturnJson = true,
  required String url,
  required JSON headers,
  required JSON data,
}) async {
  final response = await dio!.post(
    url,
    data: jsonEncode(data),
    options: Options(
        headers: headers,
        responseType: isReturnJson ? ResponseType.json : ResponseType.bytes),
  );

  return response.data;
}
