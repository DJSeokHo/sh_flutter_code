import 'package:flutter/material.dart';
import '../../framework/debug/i_log.dart';

void main() {

  const tag = "IIILooperAndConditionControl";


  var list = ["'a'", 1, 2.1, false];

  if (list.length > 3) {
    ILog.debug(tag, "a long list");
  }
  else {
    ILog.debug(tag, "a short list");
  }

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