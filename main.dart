import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) {
  var PORT = 3061;
  var tags = """

 __   __ _______   _______ _______ ___  
|  | |  |       | |   _   |       |   | 
|  |_|  |_     _| |  |_|  |    _  |   | 
|       | |   |   |       |   |_| |   | 
|_     _| |   |   |       |    ___|   | 
  |   |   |   |   |   _   |   |   |   | 
  |___|   |___|   |__| |__|___|   |___| 
v1.1
""";
  print(tags + '\nby Agus Ibrahim\nhttps://github.com/agusibrahim/YTAPIRestDart\n');
  return serve(handler, ip, PORT);
}
