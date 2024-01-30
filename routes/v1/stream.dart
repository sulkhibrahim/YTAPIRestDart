// ignore_for_file: prefer_single_quotes, prefer_final_locals, avoid_dynamic_calls, inference_failure_on_collection_literal

import 'package:dart_frog/dart_frog.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../../utils.dart';

Future<Response> onRequest(RequestContext context) async {
  // print(streamInfo.url);
  dynamic body = {
    "error": false,
    "code": 200,
    "data": {"selected_format": {}, "formats": []}
  };
  var ytid = context.request.uri.queryParameters["id"];
  if (ytid == null) {
    body["error"] = true;
    body["code"] = 401;
    body["msg"] = "paramater 'id' required. please pass youtube id";
    return Response.json(body: body);
  }
  try {
    var yt = YoutubeExplode();
    var manifest = await yt.videos.streamsClient.getManifest(ytid);
    var streamInfo = manifest.muxed.withHighestBitrate();
    body["data"]["selected_format"] = streamToJson(streamInfo);
    body["data"]["formats"] = manifest.video.map(streamVideoToJson).toList();
  } catch (e) {
    body["error"] = true;
    body["code"] = 500;
    body["msg"] = e.toString();
  }
  return Response.json(body: body);
}
