
import 'package:flutter/material.dart';

 void main() {

  runApp(
      _FOStatefulExample()
  );
}

class _FOStatefulExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: _ContentView()
        ),
      ),
    );
  }
}

class _ContentView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ContentViewState();
  }

}

class _ContentViewState extends State<_ContentView> {

  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        ElevatedButton(
            onPressed: _increment,
            child: const Text("increment")
        ),

        const SizedBox(width: 16,),
        Text("Counter $_counter")
      ],
    );
  }
}
