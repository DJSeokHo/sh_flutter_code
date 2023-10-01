
import 'package:flutter/material.dart';

void main() {
  runApp(
    _ContentView()
  );
}

class _ContentView extends StatelessWidget {

  final List<String> items = List<String>.generate(10000, (i) => 'Item $i');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Scroll bar",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Scroll bar")
        ),
        body: Center(
          child: Scrollbar(
            child: ListView.builder(
              itemCount: items.length,
              prototypeItem: ListTile(
                title: Text(items.first),
              ),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

}