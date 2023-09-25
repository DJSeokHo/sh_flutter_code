

import 'package:flutter/material.dart';

void main() {

  runApp(
      _UsingMaterialComponents()
  );
}


class _UsingMaterialComponents extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter~~~",
      home: _ContentView(),
    );
  }
}

class _ContentView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
            onPressed: null,
            icon: Icon(Icons.menu),
            tooltip: "Navigation menu"
        ),

        title: const Text("Example title"),

        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
            tooltip: "Search",
          ),
        ],
      ),

      body: const Center(
        child: Text("Hello, world!"),
      ),

      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: "Add",
        child: Icon(Icons.add),
      ),
    );
  }
}