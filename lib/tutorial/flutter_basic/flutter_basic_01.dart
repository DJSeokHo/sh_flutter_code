import 'package:flutter/material.dart';

/// 最简单的一个demo
/// StatelessWidget是无状态组件，不可变
class FlutterBasic01 extends StatelessWidget {

  const FlutterBasic01({super.key});

  @override
  Widget build(BuildContext context) {

    return const Center(
      child: Text(
        "Hello, world!",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 40,
          // color: Colors.deepOrange,
          color: Color.fromARGB(255, 246, 138, 0),
        )
      ),
    );
  }
}
