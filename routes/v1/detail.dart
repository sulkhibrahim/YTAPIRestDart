// ignore_for_file: prefer_single_quotes, lines_longer_than_80_chars, inference_failure_on_collection_literal

import 'package:dart_frog/dart_frog.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

Future<Response> onRequest(RequestContext context) async {
  var ytid = context.request.uri.queryParameters["id"];
  dynamic body = {"error": false, "code": 200, "data": {}};
  if (ytid == null) {
    body["error"] = true;
    body["code"] = 401;
    body["msg"] = "paramater 'id' required. please pass youtube id";
    return Response.json(body: body);
  }
  try {
    var yt = YoutubeExplode();
    var video = await yt.videos.get(ytid);
    body["data"] = {
      "title": video.title,
      "desc": video.description,
      "length": video.duration?.inSeconds ?? 0,
      "author": video.author,
      "thumb": video.thumbnails.mediumResUrl,
      "publish_date": video.publishDate?.toIso8601String() ?? DateTime(2000),
      "id": video.id.value,
      "channel_id": video.channelId.value,
      "is_live": video.isLive,
      "keywords": video.keywords,
    };
  } catch (e) {
    body["error"] = true;
    body["code"] = 500;
    body["msg"] = e.toString();
  }

  return Response.json(body: body);
}
