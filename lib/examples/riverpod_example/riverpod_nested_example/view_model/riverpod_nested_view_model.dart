import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodNestedViewModel {

  static final typeNotifierProvider = NotifierProvider<Type, String>(() {
    return Type();
  });

  static final typeListFutureProvider = FutureProvider.autoDispose<List<String>>((ref) {
    final type = ref.watch(typeNotifierProvider);
    return type == "A" ? ["A1", "A2", "A3"] : ["B1", "B2"];
  });

  // 也可以用带参数的方式
  static final typeListParameterFutureProvider = FutureProvider.family.autoDispose<List<String>, String>((ref, type) {
    return type == "A" ? ["A1", "A2", "A3"] : ["B1", "B2"];
  });
}

class Type extends Notifier<String> {

  @override
  String build() {
    return "A";
  }

  void toggle(String type) {
    state = type;
  }
}
