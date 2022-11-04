
import 'package:flutter/material.dart';

class FlutterBasicAspectRatioExample extends StatelessWidget {
  const FlutterBasicAspectRatioExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("AspectRatio Example"),
        ),
        body: _AspectRatioExampleView(),
      ),
    );
  }

}

class _AspectRatioExampleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: AspectRatio(
        aspectRatio: 2.0/1.0, // 高度是宽度的一半
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}