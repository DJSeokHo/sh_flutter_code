
import 'package:flutter/material.dart';

class FlutterBasicStatefulExample extends StatelessWidget {
  const FlutterBasicStatefulExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Stateful Widget Example"),
        ),
        // body: _SimpleExampleViewState(),
        body: _ListExampleViewState(),
      ),
    );
  }
}

class _ListExampleViewState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListExampleView();
  }
}
class _ListExampleView extends State<StatefulWidget> {

  List<String> list = [];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: list.map((value) {
            return ListTile(
              title: Text(value),
              subtitle: Text(value),
            );
          }).toList(),
        ),
        const SizedBox(height: 20,),
        ElevatedButton(
          onPressed: () {

            setState(() {
              list.add("I am a item");
            });
          },
          child: const Text("Button")
        )
      ],
    );
  }
}

class _SimpleExampleViewState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SimpleExampleView();
  }
}
class _SimpleExampleView extends State<StatefulWidget> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 200,),
          Text("$count"),
          const SizedBox(height: 20,),
          ElevatedButton(
              onPressed: () {

                setState(() { // 改变 UI，只有 StatefulWidget 才有这个方法
                  count++;
                });
              },
              child: const Text("Button")
          )
        ],
      ),
    );
  }
}