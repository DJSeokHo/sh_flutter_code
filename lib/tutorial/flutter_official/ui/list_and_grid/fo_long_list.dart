
import 'package:flutter/material.dart';

void main() {
  runApp(
    _ContentView()
  );
}

class _ContentView extends StatelessWidget {

  /*
  标准的 ListView 构造函数适用于短列表，对于具有大量列表项的长列表，需要用 ListView.builder 构造函数来创建。
  与标准的 ListView 构造函数需要一次性创建所有列表项不同的是， ListView.builder 构造函数只在列表项从屏幕外滑入屏幕时才去创建列表项。
   */
  final List<String> items = List<String>.generate(10000, (i) => 'Item $i');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Long list",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Long list"),
        ),
        body: ListView.builder(
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
    );
  }
}