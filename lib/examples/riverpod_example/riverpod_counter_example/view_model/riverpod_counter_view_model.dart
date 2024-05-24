// ① 创建一个状态提供者，StateProvider会观察一个值，并再改变时得到通知
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodCounterViewModel {

  static final clickCountNotifierProvider = NotifierProvider<ClickCount, int>(() {
    return ClickCount();
  });

}

class ClickCount extends Notifier<int> {

  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }
}
