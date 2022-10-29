

import '../../framework/debug/i_log.dart';

class IICollection {

  static const tag = "IICollection";

  void test() {

    listTest();
    mapTest();
  }

  void listTest() {
    
    ILog.debug(tag, "listTest start");
    var listOne = ["'1'", 2, false];
    ILog.debug(tag, listOne);
    ILog.debug(tag, "length is ${listOne.length}");
    ILog.debug(tag, listOne[1]);

    var listTwo = [];
    ILog.debug(tag, "length is ${listTwo.length}");
    listTwo.add("a");
    listTwo.add(22);
    listTwo.add(true);
    listTwo.insertAll(0, listOne);
    ILog.debug(tag, listTwo);
    ILog.debug(tag, "length is ${listTwo.length}");

    List<String> listString = [];
    listString.add("1");
    ILog.debug(tag, listString);
    listString[0] = "b";
    ILog.debug(tag, listString);
    ILog.debug(tag, "length is ${listString.length}");
    ILog.debug(tag, "listTest end");
  }

  void mapTest() {

    ILog.debug(tag, "mapTest start");
    var mapOne = {
      "name": "SeokHo",
      "age": 18,
      "coder": true
    };
    ILog.debug(tag, mapOne);
    ILog.debug(tag, mapOne.length);
    ILog.debug(tag, mapOne["coder"]);
    ILog.debug(tag, mapOne["coder"] is bool);
    ILog.debug(tag, mapOne["???"]); // not exist, so result is null

    mapOne.forEach((key, value) {
      ILog.debug(tag, "key $key: value $value ${value.runtimeType}");
    });

    var mapTwo = {};
    mapTwo["name"] = "Seok Ho";
    ILog.debug(tag, mapTwo);
    ILog.debug(tag, mapTwo.length);
    ILog.debug(tag, mapTwo["name"]);

    ILog.debug(tag, mapTwo.containsKey("age"));
    ILog.debug(tag, mapTwo.containsValue("Seok Ho"));
    ILog.debug(tag, "mapTest end");
  }
}
