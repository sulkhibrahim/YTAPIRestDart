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
