
import 'package:flutter/material.dart';

class FlutterBasicRowExample extends StatelessWidget {
  const FlutterBasicRowExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Row Example"),
        ),
        // body: _RowExampleView(),
        body: _RowInContainerExampleView(),
      ),
    );
  }

}

class _RowInContainerExampleView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 500,
      color: Colors.black54,
      child: const Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 在父view的水平位置
        // crossAxisAlignment: CrossAxisAlignment.center, // 在父view的垂直位置
        crossAxisAlignment: CrossAxisAlignment.center, // 在父view的垂直位置
        children: [
          _IconView(100, Colors.blue, Icons.search),
          _IconView(120, Colors.orange, Icons.home),
          _IconView(110, Colors.red, Icons.select_all),
        ],
      ),
    );
  }

}

class _RowExampleView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _IconView(100, Colors.blue, Icons.search),
        _IconView(120, Colors.orange, Icons.home),
        _IconView(110, Colors.red, Icons.select_all),
      ],
    );
  }

}

class _IconView extends StatelessWidget {

  final double size;
  final Color color;
  final IconData iconData;

  const _IconView(this.size, this.color, this.iconData);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: size,
      height: size,
      // color: Colors.red, Container 的 decoration 不能和 color 一起用，会出错
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      child: Center(
        child: Icon(iconData, size: 32, color: Colors.white),
      ),
    );
  }

}

void main() {
  runApp(const FlutterBasicRowExample());
}