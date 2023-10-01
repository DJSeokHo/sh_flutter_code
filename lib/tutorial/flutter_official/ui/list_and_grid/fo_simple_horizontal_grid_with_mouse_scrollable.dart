
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
      title: "Basic grid",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Basic grid"),
        ),
        body: ScrollConfiguration(
          behavior: _MouseScrollBehavior(),
          child: GridView.count(
            controller: _controller,
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
      ),
    );
  }
}