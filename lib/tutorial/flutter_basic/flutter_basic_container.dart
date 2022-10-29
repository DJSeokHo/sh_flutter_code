

import 'package:flutter/material.dart';

class ContainerDemoView extends StatelessWidget {

  const ContainerDemoView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Container Demo"),
        ),
        body: _HomeContentView(),
      )
    );
  }

}

class _HomeContentView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container( // 类似前端的 div
        width: 300.0,
        height: 300.0,
        decoration: BoxDecoration( // 装饰器
          color: Colors.deepOrange, // 背景
          border: Border.all(
            color: Colors.black45,
            width: 8.0
          ), // 边框
          borderRadius: const BorderRadius.all(Radius.circular(16.0))
        ),
        // padding: const EdgeInsets.all(10), // 内边距
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0), // 内边距
        // margin: const EdgeInsets.fromLTRB(100, 0, 0, 0), // 外边距
        // transform: Matrix4.translationValues(80, 20, 0), // 位移
        // transform: Matrix4.rotationZ(0.3), // 旋转轴位于这个容器的左上角
        alignment: Alignment.bottomLeft, // 容器子元素的位置控制
        child: const Text(
          "I am a Text I am a Text I am a Text I am a Text I am a Text",
          textAlign: TextAlign.left,
          // overflow: TextOverflow.ellipsis,
          // overflow: TextOverflow.fade,
          overflow: TextOverflow.clip,
          maxLines: 1,
          textScaleFactor: 1.2, // 字体放大两倍
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.italic,
            // decoration: TextDecoration.lineThrough,
            decoration: TextDecoration.underline,
            // decoration: TextDecoration.overline,
            decorationColor: Colors.black
          ),
        ),
      ),
    );
  }

}