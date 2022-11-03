
import 'package:flutter/material.dart';

class FlutterBasicStack extends StatelessWidget {

  const FlutterBasicStack({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Stack Example"),
        ),
        body: _StackView(),
      ),
    );
  }
}

class _StackView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text("");
  }
}