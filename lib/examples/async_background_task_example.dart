import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:isolate/isolate_runner.dart';
import 'package:isolate/load_balancer.dart';
import 'package:sh_flutter_code/framework/utility/thead/thread_utility.dart';

import '../framework/debug/i_log.dart';

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

              TextButton(
                onPressed: () async {

                  // var total = await complexTask1();
                  // ILog.debug("???", "total $total");

                  // final receivePort = ReceivePort();
                  // await Isolate.spawn(complexTask2, receivePort.sendPort);
                  // receivePort.listen((total) {
                  //   ILog.debug("???", "total $total");
                  // },);

                  // final receivePort = ReceivePort();
                  // await Isolate.spawn(complexTask3, receivePort.sendPort);
                  // receivePort.listen((total) {
                  //   ILog.debug("???", "total $total");
                  // },);

                  int countParameter1 = 100000000; // 传递的额外参数
                  int countParameter2 = 200000000; // 传递的额外参数
                  int countParameter3 = 300000000; // 传递的额外参数

                  final receivePort = ReceivePort();
                  await Isolate.spawn(complexTask5, {
                    'sendPort': receivePort.sendPort,
                    'count': countParameter1,
                  });
                  await Isolate.spawn(complexTask5, {
                    'sendPort': receivePort.sendPort,
                    'count': countParameter2,
                  });
                  await Isolate.spawn(complexTask5, {
                    'sendPort': receivePort.sendPort,
                    'count': countParameter3,
                  });
                  receivePort.listen((total) {
                    ILog.debug("???", "total $total");
                  });
                },
                child: const Text('开始耗时工作'),
              )
            ],
          ),
        ),
      ),
    );
  }

  static void complexTask5(Map<String, dynamic> params) async {
    SendPort sendPort = params['sendPort'];
    int count = params['count']; // 提取额外的参数

    var total = 0.0;
    for (var i = 0; i < count; i++) {
      total += i;
    }
    sendPort.send(total);
  }

  Future<double> complexTask1() async {
    var total = 0.0;
    for (var i = 0; i < 300000000; i++) {
      total += i;
    }
    return total;
  }

  static void complexTask3(SendPort sendPort) async {
    var total = 0.0;
    for (var i = 0; i < 300000000; i++) {
      total += i;
    }
    sendPort.send(total);
  }
}

complexTask2(SendPort sendPort) async {
  var total = 0.0;
  for (var i = 0; i < 300000000; i++) {
    total += i;
  }
  sendPort.send(total);
}

complexTask6() async {
  var total = 0.0;
  for (var i = 0; i < 300000000; i++) {
    total += i;
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
