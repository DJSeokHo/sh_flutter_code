import 'dart:async';
import 'dart:isolate';

class ThreadUtility {
  /// 启动隔离线程，执行指定的函数 `task`。`parameter` 可选。
  /// `onSuccess` 回调用于接收结果，`onError` 回调用于处理错误。
  static Future<void> start<R, P>(
      FutureOr<R> Function(P parameter) task, // 任务函数
      P? parameter,
      Function(R) onSuccess,
      Function(Object) onError) async {
    final receivePort = ReceivePort();

    try {
      // 如果 `parameter` 是 null，则假定任务函数 `task` 无参数。
      await Isolate.spawn(_isolateEntry<P, R>, {
        'task': task,
        'parameter': parameter,
        'sendPort': receivePort.sendPort,
      });

      receivePort.listen((result) {
        if (result is R) {
          onSuccess(result);
        } else {
          onError(Exception("Unexpected result type"));
        }
        receivePort.close();
      });
    } on Object catch (e) {
      receivePort.close();
      onError(e);
    }
  }

  /// 隔离线程的入口函数，支持无参数和带参数的任务。
  static void _isolateEntry<P, R>(Map<String, dynamic> message) async {
    final task = message['task'] as FutureOr<R> Function(P?);
    final parameter = message['parameter'] as P?;
    final sendPort = message['sendPort'] as SendPort;

    try {
      final result = await task(parameter);
      sendPort.send(result);
    } catch (e) {
      sendPort.send(e);
    }
  }
}
