import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sh_flutter_code/examples/riverpod_example/riverpod_counter_example/riverpod_counter_example_sub_page.dart';
import 'package:sh_flutter_code/examples/riverpod_example/riverpod_counter_example/view_model/riverpod_counter_view_model.dart';

void main() {
  // ② 想使用Riverpod 的 Provider 必须用 ProviderScope 包裹MyApp！
  runApp(const ProviderScope(child: MyApp()));
}

// ③ 继承ConsumerWidget，它是可以提供监听Provider的Widget
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /*
    watch() ：监听Provider，当状态改变时，使用 watch() 的 Widget 会自动重建。
    read() ：只读取Provider的当前状态，状态改变，Widget不会重建。
    listen() ：通常用于在 build() 中监听Provider，当状态改变时，会调用设置的监听器，监听器会在Widget重建时自动移除。 当值变化的时候执行一个动作，如打开一个新页面或展示一个新内容。（事件触发用listen）
    listenManual() ：通常在 State.initState() 或其它生命周期中监听Provider，此方法返回一个 ProviderSubscription 对象，可以使用它来停止监听close()，或者读取Provider的当前状态。
    refresh() ：立即使Provider的当前状态无效，重新计算并返回新值，常用于触发异步 Provider 的重新获取数据，如：下拉刷新、错误重试 等场景。
    invalidate() ：refresh()的异步版，使Provider的当前状态无效，然后在下一次读取provider或者下一帧时，Provider会被重新计算。refresh() 是同步的，它是 异步 的，没有返回值。
    exists() ：判断 Provider 是否已经初始化。
     */
    // ④ 通过ref.watch() 来监听Provider的值，当Provider的值改变时，会自动刷新UI
    final int count = ref.watch(RiverpodCounterViewModel.clickCountNotifierProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Riverpod Demo')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('点击计数：$count'),
              Builder(builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RiverpodCounterExampleSubPage()),
                    );
                  },
                  child: const Text('跳转到增加计数页面'),
                );
              })
            ],
          )),
      ),
    );
  }
}
