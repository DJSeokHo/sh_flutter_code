
import 'package:flutter/material.dart';

void main() {
  runApp(
      _ContentView()
  );
}

class _ContentView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Basic list",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Basic list"),
        ),
        body: ListView( // 可滚动
          children: const [

            ListTile(
              leading: Icon(Icons.map),
              title: Text("Map"),
            ),

            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text("Albm"),
            ),

            ListTile(
              leading: Icon(Icons.phone),
              title: Text("Phone"),
            )

          ],
        ),
      ),
    );
  }

}