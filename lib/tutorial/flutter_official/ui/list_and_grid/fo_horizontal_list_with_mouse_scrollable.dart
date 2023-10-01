
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      _ContentView()
  );
}

class _MouseScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    // etc.
  };
}

class _ContentView extends StatelessWidget {

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Horizontal List",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Horizontal List"),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: 200,
          child: ScrollConfiguration(
            behavior: _MouseScrollBehavior(),
            child: ListView(
              controller: _controller,
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