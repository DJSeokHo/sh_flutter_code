import 'package:flutter/foundation.dart';

class ILog {

  static void debug(String tag, Object? content) {

    if (kDebugMode) {
      if (content != null) {
        print("ILog: $tag ===> $content");
      }
      else {
        print("ILog: $tag ===> null");
      }
    }
  }
}