
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
      title: "Basic grid",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Basic grid"),
        ),
        body: GridView.count(
          scrollDirection: Axis.horizontal,
          crossAxisCount: 2,
          children: List.generate(100, (index) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            );
          }),
        ),
      ),
    );
  }
}