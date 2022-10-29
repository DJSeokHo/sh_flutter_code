

import 'dart:convert';
import 'package:http/http.dart';

import 'package:sh_flutter_code/framework/debug/i_log.dart';
import 'package:sh_flutter_code/tutorial/dart_console/i_parameter.dart';

import '../tutorial/dart_console/ii_collection.dart';
import '../tutorial/dart_console/iii_condition_control.dart';
import '../tutorial/dart_console/iv_function.dart';
import '../tutorial/dart_console/v_class.dart';
import '../tutorial/dart_console/vi_abstract_class.dart';
import '../tutorial/dart_console/vii_interface.dart';


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

  void ivFunction() {
    IVFunction ivFunction = IVFunction();
    ivFunction.test();
    ILog.debug(tag, IVFunction.staticReturnString());
  }

  void vClass() {
    VClass vClass = VClass();
    vClass.test();
  }

  void viAbstractClass() {
    VIAbstractClass viAbstractClass = VIAbstractClass();
    viAbstractClass.test();
  }

  void viiInterface() {
    VIIInterface viiInterface = VIIInterface();
    viiInterface.test();
  }

  void fetchDataTest() async {
    /**
     * 可能遇到奇葩错误，
     * flutter\bin\cache flutter_tools.stamp 파일 삭제
     * flutter/packages/flutter_tools/lib/src/web 이동
     * chrome.dart 파일 수정
     * --disable-extensions 아래에 --disable-web-security 입력
     */
    ILog.debug(tag, 'fetchDataTest');

    var client = Client();

    var urlString = "34.64.141.125"; // 纯域名，不要加协议头
    var url = Uri.https(urlString);
    final response = await client.get(url);
    ILog.debug(tag, response.body);
  }

}
