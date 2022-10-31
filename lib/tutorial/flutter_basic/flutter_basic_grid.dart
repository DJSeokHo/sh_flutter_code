
import 'package:flutter/material.dart';

class FlutterBasicGridView extends StatelessWidget {
  const FlutterBasicGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Grid View"
          ),
        ),
        body: _ContentView(),
      ),
    );
  }
}

class _ContentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text("Hello");
  }
}