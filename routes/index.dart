// ignore_for_file: prefer_single_quotes, lines_longer_than_80_chars, inference_failure_on_collection_literal

import 'package:dart_frog/dart_frog.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

dynamic streamToJson(MuxedStreamInfo streamInfo) {
  return {
    "itag": streamInfo.tag,
    "url": streamInfo.url.toString(),
    "mimeType": streamInfo.codec.mimeType,
    "bitrate": streamInfo.bitrate.bitsPerSecond,
    "width": streamInfo.videoResolution.width,
    "height": streamInfo.videoResolution.height,
    "initRange": {"start": "0", "end": "0"},
    "indexRange": {"start": "0", "end": "0"},
    "lastModified": "0",
    "contentLength": "${streamInfo.size.totalBytes}",
    "quality": streamInfo.videoQuality.name,
    "fps": streamInfo.framerate.framesPerSecond,
    "qualityLabel": streamInfo.qualityLabel,
    "projectionType": "RECTANGULAR",
    "averageBitrate": 0,
    "highReplication": true,
    "approxDurationMs": "0",
    "has_audio": true,
    "has_video": true
  };
}

dynamic streamVideoToJson(VideoStreamInfo streamInfo) {
  return {
    "itag": streamInfo.tag,
    "url": streamInfo.url.toString(),
    "mimeType": streamInfo.codec.mimeType,
    "bitrate": streamInfo.bitrate.bitsPerSecond,
    "width": streamInfo.videoResolution.width,
    "height": streamInfo.videoResolution.height,
    "initRange": {"start": "0", "end": "0"},
    "indexRange": {"start": "0", "end": "0"},
    "lastModified": "0",
    "contentLength": "${streamInfo.size.totalBytes}",
    "quality": streamInfo.videoQuality.name,
    "fps": streamInfo.framerate.framesPerSecond,
    "qualityLabel": streamInfo.qualityLabel,
    "projectionType": "RECTANGULAR",
    "averageBitrate": 0,
    "highReplication": true,
    "approxDurationMs": "0",
    "has_audio": streamInfo.codec.type,
    "has_video": "${streamInfo.codec.parameters["codecs"]}".contains("mp4"),
    "has_videos": true,
  };
}

Future<Response> onRequest(RequestContext context) async {
  var body = "It's working. use /detail?id=yt_id_here or /stream?id=yt_id_here";
  return Response(body: body);
}
/*

var tags = """

 __   __ _______   _______ _______ ___  
|  | |  |       | |   _   |       |   | 
|  |_|  |_     _| |  |_|  |    _  |   | 
|       | |   |   |       |   |_| |   | 
|_     _| |   |   |       |    ___|   | 
  |   |   |   |   |   _   |   |   |   | 
  |___|   |___|   |__| |__|___|   |___| 

""";
  print(tags + '\nby Agus Ibrahim\nhttps://github.com/agusibrahim\n\n\x1B[92m✓\x1B[0m Running on http://${server.address.host}:${server.port}');

*/