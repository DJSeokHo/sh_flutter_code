
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
      title: "row and colum",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("row and colum"),
        ),
        // body: _RowExampleView()
        body: _ColumnExampleView()
      ),
    );
  }
}

class _RowExampleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('images/coding_with_cat_icon.jpeg'),
        Image.asset('images/coding_with_cat_icon.jpeg'),
        Image.asset('images/coding_with_cat_icon.jpeg'),
      ],
    );
  }
}

class _ColumnExampleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('images/coding_with_cat_icon.jpeg'),
        Image.asset('images/coding_with_cat_icon.jpeg'),
        Image.asset('images/coding_with_cat_icon.jpeg'),
      ],
    );
  }
}