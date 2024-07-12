import 'dart:async';

import 'package:flutter/material.dart';
import 'package:isolate/isolate_runner.dart';
import 'package:isolate/load_balancer.dart';

void main() {
  runApp(const AsyncBackgroundTaskExample());
}

class AsyncBackgroundTaskExample extends StatefulWidget {
  const AsyncBackgroundTaskExample({super.key});


  @override
  State<StatefulWidget> createState() {
    return _AsyncBackgroundTaskExample();
  }
}

class _AsyncBackgroundTaskExample extends State<AsyncBackgroundTaskExample> {

  int _count = 0;

  //耗时工作，计算偶数个数
  static Future<int> asyncCountEven(int num) async {
    int count = 0;
    while (num > 0) {
      if (num % 2 == 0) {
        count++;
      }
      num--;
    }
    return count;
  }

  //模拟Future耗时
  void doMockTimeConsume() async {
    // _count = await asyncCountEven(1000000000);

    _count = await ISOManager.loadBalanceFuture<int, int>((argument) {
      return asyncCountEven(argument);
    }, 1000000000);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(),
              ),
              Text(_count.toString()),
              TextButton(
                onPressed: () {
                  //触发耗时操作
                  /*
                  为什么会出现卡顿呢？
                  因为 Future 仍然是在同一个UI线程中做运算，异步只是在同一个线程的并发操作，仍会阻塞UI的刷新。

                  解决方法：创建新线程，使用 Isolate
                  Flutter team 提供了两种方式让我们将计算移到新的线程中，compute 和 Isolate:
                  compute 轻量级，但它没有办法多次返回结果，也没有办法持续性的传值计算，每次调用，相当于新建一个隔离，如果调用过多的话反而会适得其反。
                  Isolate 消耗较重，除了创建耗时，每次创建还至少需要2Mb的空间。有OOM的风险。

                  考虑到Isolate的消耗问题，dart team 已经为我们写好一个非常实用的 package，其中就包括 Isolate LoadBalancer 策略。

                  添加package引用 isolate: ^2.0.2

                  在 Dart 中，使用 Isolate 或 compute 函数执行耗时任务时，需要将函数声明为 static。这是因为 Dart 的 Isolate 是独立的执行环境，它们没有对外部对象（包括类实例）的直接访问权限。下面是详细的解释：

                  为什么需要 static 函数
                  Isolate 独立性:

                  Isolate 是独立的执行单元，它有自己的内存空间，与主 Isolate 没有共享内存。
                  因此，Isolate 无法直接访问主 Isolate 中的实例变量和实例方法。
                  函数必须是顶层或静态:

                  为了在新的 Isolate 中执行函数，函数必须是顶层函数或静态方法。
                  这是因为只有顶层函数或静态方法可以在没有特定对象实例的情况下被调用和序列化。
                  实例方法绑定到特定对象实例，而 Isolate 无法访问这些实例。
                  序列化的要求:

                  传递给 Isolate 的所有数据必须是可序列化的。顶层函数和静态方法满足这一要求，因为它们不依赖于特定的对象实例和不可序列化的上下文。
                   */
                  doMockTimeConsume();
                },
                child: const Text('开始耗时工作'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

abstract class ISOManager {
  //提供外部首次初始化前修改
  static int isoBalanceSize = 2;

  //LoadBalancer 2个单位的线程池
  static final Future<LoadBalancer> _loadBalancer = LoadBalancer.create(isoBalanceSize, IsolateRunner.spawn);

  //通过iso在新的线程中执行future内容体
  //R 为Future返回泛型，P 为方法入参泛型
  //function 必须为 static 方法
  static Future<R> loadBalanceFuture<R, P>(
    FutureOr<R> Function(P argument) function,
    P params,
  ) async {
    final lb = await _loadBalancer;
    return lb.run<R, P>(function, params);
  }
}
