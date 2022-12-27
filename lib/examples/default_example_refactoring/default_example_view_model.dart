
import 'package:flutter/material.dart';

import '../../framework/debug/i_log.dart';
import 'default_example_model.dart';

class DefaultExampleViewModel extends ChangeNotifier {

  static const _tag = "DefaultExampleViewModel";

  DefaultExampleViewModel() {
    ILog.debug(_tag, "construction");
  }

  DefaultExampleModel? model;

  void signIn() {
    model = DefaultExampleModel();
    model!.name = "SeokHo";
    notifyListeners(); //通知监听者，必须要调用
  }

}