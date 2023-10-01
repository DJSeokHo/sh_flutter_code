
import 'package:flutter/material.dart';

void main() {
  runApp(
    _ContentView()
  );
}

class _ContentView extends StatelessWidget {

  final List<String> items = List<String>.generate(20, (i) => 'Item $i');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Scroll bar",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Scroll bar")
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: 200,
          child: Scrollbar(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 160,
                  color: Colors.red,
                ),
                Container(
                  width: 160,
                  color: Colors.blue,
                ),
                Container(
                  width: 160,
                  color: Colors.green,
                ),
                Container(
                  width: 160,
                  color: Colors.yellow,
                ),
                Container(
                  width: 160,
                  color: Colors.orange,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}