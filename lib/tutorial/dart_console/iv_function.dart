import 'package:flutter/material.dart';
import 'package:sh_flutter_code/framework/debug/i_log.dart';

class IVFunction {

  static const tag = "IVFunction";

  // 函数变量
  var function = (String name, {int age = 18}) {
    ILog.debug(tag, "name is $name and age is $age");
  };

  void test() {

    ILog.debug(tag, "function test start");

    functionWithLambdaParameter(() => {
      ILog.debug(tag, "I am callback")
    });
    ILog.debug(tag, returnInt());
    ILog.debug(tag, returnString());
    ILog.debug(tag, returnList());
    ILog.debug(tag, returnStringList());
    ILog.debug(tag, returnSum(5, 5));
    ILog.debug(tag, returnOptionParameter("SeokHo"));
    ILog.debug(tag, returnOptionParameter("SeokHo", age: 20));

    ILog.debug(tag, "function test end");

    function("SeokHo", age: 20);
    _test();
  }

  // 私有方法
  void _test() {

  }

  void functionWithLambdaParameter(var callback) {
    callback();
  }


  int returnInt() {
    return 5;
  }

  String returnString() {
    return "SH";
  }

  static String staticReturnString() {
    return "123";
  }

  List returnList() {
    return ["1", 2, true];
  }

  List<String> returnStringList() {
    return ["1", "2", "3"];
  }

  int returnSum(int a, int b) {
    return a + b;
  }

  String returnOptionParameter(String name, {int age = 18}) {
    return "$name $age";
  }

}

void main() {
  IVFunction().test();
}