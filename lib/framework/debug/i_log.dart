import 'package:flutter/foundation.dart';

class ILog {

  static void debug(String tag, Object? content) {

    if (kDebugMode) {
      print("ILog: $tag ===> $content");
    }
  }
}