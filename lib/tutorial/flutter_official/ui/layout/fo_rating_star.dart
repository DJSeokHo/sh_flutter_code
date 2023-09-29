
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
      title: "expanded",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("expanded"),
        ),
        body: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star, color: Colors.green[500]),
            Icon(Icons.star, color: Colors.green[500]),
            Icon(Icons.star, color: Colors.green[500]),
            const Icon(Icons.star, color: Colors.black),
            const Icon(Icons.star, color: Colors.black),
          ],
        ),
      ),
    );
  }

}