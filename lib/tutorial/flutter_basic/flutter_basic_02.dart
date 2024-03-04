import 'package:flutter/material.dart';

class FlutterBasic02 extends StatelessWidget {

  const FlutterBasic02({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Demo"),
        ),
        body: Center(
          child: Container(
            alignment: Alignment.bottomRight, // 让container里的子元素处于container的底部剧中
            width: 500,
            height: 400,
            margin: const EdgeInsets.all(10), // 外边距
            padding: const EdgeInsets.all(20), // 内边距
            decoration: BoxDecoration( // 装饰器
                // color: Colors.deepOrange, // 背景
              gradient: const LinearGradient(
                colors: [
                  Colors.lightBlue,
                  Colors.greenAccent,
                  Colors.purple
                ]
              ),
              border: Border.all(
                  color: Colors.black45,
                  width: 8.0
              ), // 边框
              borderRadius: const BorderRadius.all(Radius.circular(16.0))
            ),
            // color: Colors.lightBlue, // 如果设置了 decoration 的 color的话，外面的color就要去掉
            child: const Text(
              "Hello, container",
              style: TextStyle(
                fontSize: 40
              ),
            ),
          ),
        ),
      ),
      // theme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange
      ),
    );

  }
}

void main() {
  runApp(const FlutterBasic02());
}