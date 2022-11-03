
import 'package:flutter/material.dart';

class FlutterBasicColumnExample extends StatelessWidget {
  const FlutterBasicColumnExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Column Example"),
        ),
        // body: _ColumnExampleView(),
        body: _ColumnInContainerExampleView(),
      ),
    );
  }

}

class _ColumnInContainerExampleView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 500,
      color: Colors.black54,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 在父view的垂直位置，和row相反
        crossAxisAlignment: CrossAxisAlignment.end, // 在父view的水平位置，和row相反
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          _IconView(100, Colors.blue, Icons.search),
          _IconView(120, Colors.orange, Icons.home),
          _IconView(110, Colors.red, Icons.select_all),
        ],
      ),
    );
  }

}

class _ColumnExampleView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
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