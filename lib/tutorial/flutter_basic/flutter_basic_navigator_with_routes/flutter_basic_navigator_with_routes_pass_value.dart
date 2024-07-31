
import 'package:flutter/material.dart';


class FlutterBasicNavigatorWithRoutePassValueView extends StatelessWidget {

  final Map arguments;

  const FlutterBasicNavigatorWithRoutePassValueView(this.arguments, {super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pass Value"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Value is ${arguments["value"]}"),
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
