
import 'package:flutter/material.dart';

class FlutterBasicSwitch extends StatefulWidget {
  const FlutterBasicSwitch({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ContentView();
  }

}

class _ContentView extends State<StatefulWidget> {

  var _flag = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Switch Example"),
        ),
        body: Center(
          child: Switch(
            value: _flag,
            onChanged: (value) {
              setState(() {
                _flag = value;
              });
            },
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const FlutterBasicSwitch());
}