import 'package:flutter/material.dart';
import '../../framework/debug/i_log.dart';

class IParameter {

  static const tag = "I_Parameter";

  void test() {

    String name = "seok ho\nHow are you?";
    ILog.debug(tag, name);

    int i = 123;
    ILog.debug(tag, i);

    double d = 456.5;
    ILog.debug(tag, d);

    bool b = true;
    ILog.debug("main", b);
  }
}

void main() {

  IParameter().test();

}