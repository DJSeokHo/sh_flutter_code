

import 'package:flutter/material.dart';

void main() {
  runApp(
      _ContentView()
  );
}

class _ContentView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "expanded",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("expanded"),
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset('images/coding_with_cat_icon.jpeg')
            ),
            Expanded(
              // flex: 2, // 也许你想要一个 widget 占用的空间是兄弟项的两倍。为了达到这个效果，可以使用 Expanded widget 的 flex 属性，这是一个用来确定 widget 的弹性系数的整数。默认的弹性系数为 1。
              child: Image.asset('images/coding_with_cat_icon.jpeg')
            ),
            Expanded(
              child: Image.asset('images/coding_with_cat_icon.jpeg')
            )
          ],
        ),
      ),
    );
  }
}