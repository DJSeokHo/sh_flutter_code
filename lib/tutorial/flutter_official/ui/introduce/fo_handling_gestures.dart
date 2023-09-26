
import 'package:flutter/material.dart';

import '../../../../framework/debug/i_log.dart';

void main() {
  runApp(
      _FOHandingGestures()
  );
}

class _ContentView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: () {
        ILog.debug("???", "Button was tapped");
      },

      child: Container(
        height: 50,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.lightGreen[500],
        ),
        child: const Center(
          child: Text("Engage"),
        ),
      ),
    );
  }
}

class _FOHandingGestures extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: _ContentView(),
        ),
      ),
    );
  }
}