
import 'package:flutter/material.dart';

class FlutterBasicNavigatorPassValueWithRoute extends StatelessWidget {

  final String arguments;

  const FlutterBasicNavigatorPassValueWithRoute({this.arguments = "", super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pass Value"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Value is $arguments"),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Back")
            )
          ],
        ),
      ),
    );
  }
}
