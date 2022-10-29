
import '../../framework/debug/i_log.dart';

class IIIConditionControl {

  static const tag = "IIIConditionControl";

  void testAdvance() {

  }

  void test() {

    var list = ["'a'", 1, 2.1, false];

    for (int i = 0; i < list.length; i++) {

      ILog.debug(tag, "${list[i]} ${list[i].runtimeType}");

    }

    int i = 0; 
    while(i < list.length) {
      ILog.debug(tag, "${list[i]} ${list[i].runtimeType}");
      i++;
    }

    i = 0;
    do {
      ILog.debug(tag, "${list[i]} ${list[i].runtimeType}");
      i++;
    }
    while(i < list.length);

    var name = "SeokHo";
    switch (name) {

      case "SeokHo":
        ILog.debug(tag, "good");
        break;

      default:
        break;
    }
  }
}