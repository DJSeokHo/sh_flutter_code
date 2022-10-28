

import 'package:sh_flutter_code/framework/debug/i_log.dart';
import 'package:sh_flutter_code/tutorial/i_parameter.dart';
import 'package:sh_flutter_code/tutorial/ii_collection.dart';

import '../tutorial/iii_condition_control.dart';


class DartTest {

  static const tag = "DartTest";

  void helloWorld() {
    ILog.debug(tag, "hello world");
  }

  void greeting(String name) {
    ILog.debug(tag, "hello $name");
  }

  void iParameter() {
    IParameter iParameter = IParameter();
    iParameter.test();
  }

  void iiCollection() {
    IICollection iiCollection = IICollection();
    iiCollection.test();
  }

  void iiiConditionControl() {
    IIIConditionControl iiiConditionControl = IIIConditionControl();
    iiiConditionControl.test();
    iiiConditionControl.testAdvance();
  }
}
