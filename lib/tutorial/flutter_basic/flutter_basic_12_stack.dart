
import 'package:flutter/material.dart';

/// 层叠组建，实现定位布局。可以结合 Align 和 Positiond 组建来实现复杂定位。
class FlutterBasicStack extends StatelessWidget {

  const FlutterBasicStack({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Stack Example"),
        ),
        // body: _StackView(),
        // body: _StackViewWithAlign(),
        body: _StackViewWithPositiond(),
      ),
    );
  }
}

/// 用于多个子组建各自定位
class _StackViewWithPositiond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      color: Colors.red,
      child: Stack(
        children: const [
          Positioned(
            left: 10, // 距离左边 10
            child: Icon(Icons.home, size: 40, color: Colors.white),
          ),
          Positioned(
            bottom: 0, // 距离底部 0
            child:  Icon(Icons.search, size: 30, color: Colors.blue),
          ),
          Positioned(
              right: 10, // 距离右边 10
              top: 10, // 距离顶部 10
              child: Icon(Icons.send, size: 60, color: Colors.orange)
          ),
        ],
      ),
    );
  }

}

/// 用于多个子组建各自定位
class _StackViewWithAlign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      color: Colors.red,
      child: Stack(
        children: const [
          Align(
            alignment: Alignment.topLeft,
            child: Icon(Icons.home, size: 40, color: Colors.white),
          ),
          Align(
            alignment: Alignment.center,
            child:  Icon(Icons.search, size: 30, color: Colors.blue),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Icon(Icons.send, size: 60, color: Colors.orange)
          ),
        ],
      ),
    );
  }

}

/// 用于统一定位子组建
class _StackView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment: Alignment.bottomRight, // 控制所有子元素的位置
      alignment: const Alignment(-1, 0.3), // 控制所有子元素的位置, x, y 的值是 -1 ~ 1，所以 1, 1代表右下角，-1, 0 代表左边居中。
      children: [
        Container(
          width: 300,
          height: 400,
          color: Colors.red
        ),
        const Text(
          "I am a text",
          style: TextStyle(
            fontSize: 40,
            color: Colors.white
          ),
        )
      ],
    );
  }
}

void main() {
  runApp(const FlutterBasicStack());
}