import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sh_flutter_code/examples/riverpod_example/riverpod_bored_example/model/activity_model.dart';
import 'package:sh_flutter_code/examples/riverpod_example/riverpod_bored_example/view_model/riverpod_bored_view_model.dart';

/*
Provider 返回任何类型 服务类/计算属性（过滤列表） - 只存储不可变的值或对象，最简单的状态提供者，只对外提供访问状态值的接口，外部无法对状态值进行修改。
StateProvider 返回任何类型 过滤器条件/简单状态对象 - 存储可变的值或对象 (过时了)
FutureProvider 返回任何类型的一个Future API调用的结果 - 处理异步操作，如：从网络请求数据数据，它会再Future完成时通知其观察者。通常与 autoDispose 修饰符一起使用。
StreamProvider 返回任何类型的流 来自API的结果流 - 处理基于流的异步数据，监听一个Stream，并在新数据到达前通知其观察者。
NotifierProvider 相当于最基础的Provider + 支持外部修改其缓存state

NotifierProvider：提供一种更灵活的方式来管理状态和业务逻辑，支持任何类型的 “Notifier” 。
AsyncNotifierProvider：专门用于管理异步操作的状态，如网络请求，它提供了一个结构化的方法来处理异步数据的加载、成功、错误和状态更新。
 */
void main() {
  runApp(const ProviderScope(
      child: MaterialApp(home: RiverpodBoredExampleView())));
}

class RiverpodBoredExampleView extends ConsumerWidget {
  const RiverpodBoredExampleView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<ActivityModel> activityModel =
        ref.watch(activityFutureProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod bored View"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: activityModel.when(
          data: (data) {
            return Column(
              children: [
                Text(data.key),
                Text(data.activity),
                Text(data.type),
              ],
            );
          },
          error: (err, stack) => Text('Error: $err'),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          ref.invalidate(activityFutureProvider);
        },
      ),
    );
  }
}
