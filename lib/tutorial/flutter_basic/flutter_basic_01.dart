import 'dart:ui';

import 'package:flutter/material.dart';

/// 最简单的一个demo
/// StatelessWidget是无状态组件，不可变
class FlutterBasic01 extends StatelessWidget {

  const FlutterBasic01({super.key});

  @override
  Widget build(BuildContext context) {

    return const Center(
      child: Text(
        "Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!",
        textDirection: TextDirection.ltr, // 文本方向
        textAlign: TextAlign.right, // 文本自身的左对齐，文本控件自身在容器中的位置无关
        maxLines: 1, // 最多显示一行
        overflow: TextOverflow.ellipsis, // 所以超出部分需要截断
        style: TextStyle(
          fontSize: 40,
          // color: Colors.deepOrange,
          color: Color.fromARGB(255, 246, 138, 0),
          decoration: TextDecoration.underline, // 下划线装饰
          decorationStyle: TextDecorationStyle.dashed // 装饰的方法，这里用的是虚线下划线
        )
      ),
    );
  }
}

void main() {
  runApp(
      const FlutterBasic01()
  );
}