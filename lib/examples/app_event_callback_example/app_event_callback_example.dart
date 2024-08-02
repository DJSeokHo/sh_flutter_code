import 'package:flutter/material.dart';
import 'package:sh_flutter_code/framework/debug/i_log.dart';

void main() {

  runApp(MaterialApp(
    home: _AppEventCallbackExample(),
  ));
}

class _AppEventCallbackExample extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _AppEventCallbackExampleState();
  }

}

class _AppEventCallbackExampleState extends State<_AppEventCallbackExample> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    // 单次 Frame 绘制回调，通过 addPostFrameCallback 实现。它会在当前 Frame 绘制完成后进行进行回调，并且只会回调一次，如果要再次监听则需要再设置一次。
    WidgetsBinding.instance.addPostFrameCallback((_){
      ILog.debug("???", "单次Frame绘制回调");//只回调一次
    });

    // 实时 Frame 绘制回调，则通过 addPersistentFrameCallback 实现。这个函数会在每次绘制 Frame 结束后进行回调，可以用做 FPS 监测。
    WidgetsBinding.instance.addPersistentFrameCallback((_){
      ILog.debug("???", "实时Frame绘制回调");//每帧都回调
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /*
    页面pop Future didPopRoute() => Future.value(false);
    页面push Future didPushRoute(String route) => Future.value(false);
    系统窗口相关改变回调，如旋转 void didChangeMetrics() { }
    文本缩放系数变化 void didChangeTextScaleFactor() { }
    系统亮度变化 void didChangePlatformBrightness() { }
    本地化语言变化 void didChangeLocales(List locale) { }
    App生命周期变化 void didChangeAppLifecycleState(AppLifecycleState state) { }
    内存警告回调 void didHaveMemoryPressure() { }
    Accessibility相关特性回调 void didChangeAccessibilityFeatures() {}
   */
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    ILog.debug("????", "$state");
    if (state == AppLifecycleState.resumed) { //do sth }
      ILog.debug("????", "resumed");
    }
    else if (state == AppLifecycleState.paused) {
      ILog.debug("????", "paused");
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "AppEventCallbackExample"
      ),
    );
  }
}