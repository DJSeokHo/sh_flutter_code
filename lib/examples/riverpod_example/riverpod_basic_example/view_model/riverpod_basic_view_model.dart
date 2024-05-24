
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sh_flutter_code/examples/riverpod_example/riverpod_basic_example/repository/riverpod_basic_repository.dart';

/*
Provider 返回任何类型 服务类/计算属性（过滤列表） - 只存储不可变的值或对象，最简单的状态提供者，只对外提供访问状态值的接口，外部无法对状态值进行修改。
StateProvider 返回任何类型 过滤器条件/简单状态对象 - 存储可变的值或对象 (过时了, 用NotifierProvider代替)
FutureProvider 返回任何类型的一个Future API调用的结果 - 处理异步操作，如：从网络请求数据数据，它会再Future完成时通知其观察者。通常与 autoDispose 修饰符一起使用。
StreamProvider 返回任何类型的流 来自API的结果流 - 处理基于流的异步数据，监听一个Stream，并在新数据到达前通知其观察者。
NotifierProvider 相当于最基础的Provider + 支持外部修改其缓存state

NotifierProvider：提供一种更灵活的方式来管理状态和业务逻辑，支持任何类型的 “Notifier” 。
AsyncNotifierProvider：专门用于管理异步操作的状态，如网络请求，它提供了一个结构化的方法来处理异步数据的加载、成功、错误和状态更新。
 */
class RiverpodBasicViewModel {

  static final helloWorldProvider = Provider((_) {
    return "Hello world";
  });

  static final counterNotifierProvider = NotifierProvider<Count, int>(() {
    return Count();
  });

  static final counterStreamProvider = StreamProvider<int>((ref) {
    return RiverpodBasicRepository.getCounterStream();
  });

  /*
  因为是autoDispose, SubView 页面退出时这个值会自动dispose，下次再进入SubView时，这个值就是0.
  想保存状态的话就不要用autoDispose
   */
  static final counterForSubViewNP = AutoDisposeNotifierProvider<AutoDisposeCount, int>(() {
    return AutoDisposeCount();
  });

}

class Count extends Notifier<int> {

  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }
}

class AutoDisposeCount extends AutoDisposeNotifier<int> {

  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }
}

