

import 'package:sh_flutter_code/framework/debug/i_log.dart';


class DartTest {

  static const tag = "DartTest";

  void helloWorld() {
    ILog.debug(tag, "hello world");
  }

  void greeting(String name) {
    ILog.debug(tag, "hello $name");
  }

}
