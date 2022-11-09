
import 'package:flutter/material.dart';

class FlutterBasicCheckBoxListItem extends StatefulWidget {
  const FlutterBasicCheckBoxListItem({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ContentView();
  }
}

class _ContentView extends State<StatefulWidget> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Check box list item"),
        ),
        body: ,
      ),
    );
  }

}