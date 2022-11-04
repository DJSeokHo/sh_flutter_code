
import 'package:flutter/material.dart';

class FlutterBasicNavigatorPassValue extends StatelessWidget {

  final String value;

  const FlutterBasicNavigatorPassValue({this.value = "", super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pass Value"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Value is $value"),
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
