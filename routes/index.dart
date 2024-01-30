// ignore_for_file: prefer_single_quotes, lines_longer_than_80_chars, inference_failure_on_collection_literal

import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  var body = "It's working. use /detail?id=yt_id_here or /stream?id=yt_id_here";
  return Response(body: body);
}
