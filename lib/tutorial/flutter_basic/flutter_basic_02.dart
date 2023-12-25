import 'package:flutter/material.dart';

class FlutterBasic02 extends StatelessWidget {

  const FlutterBasic02({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Demo"),
        ),
        body: const HomeContentView(),
      ),
      // theme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange
      ),
    );

  }
}

class HomeContentView extends StatelessWidget {

  const HomeContentView({super.key});

  @override
  Widget build(BuildContext context) {

    return const Center(
      child: Text(
          "Hello, world!",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 40,
            // color: Colors.deepOrange,
            color: Color.fromARGB(255, 246, 138, 0),
          )
      ),
    );
  }
}

void main() {
  runApp(const FlutterBasic02());
}