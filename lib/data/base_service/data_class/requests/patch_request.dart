// ignore_for_file: non_constant_identifier_names, always_specify_types
part of 'base_request.dart';

Future<dynamic> PatchRequest(
  Dio? dio, {
  required String url,
  required JSON headers,
  required JSON data,
}) async {
  final response = await dio!.patch(
    url,
    data: jsonEncode(data),
    options: Options(headers: headers),
  );

  return response.data;
}
