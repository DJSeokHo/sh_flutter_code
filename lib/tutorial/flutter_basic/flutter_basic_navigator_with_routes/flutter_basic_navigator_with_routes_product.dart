
import 'package:flutter/material.dart';

class FlutterBasicNavigatorWithRoutesProductStateView extends StatefulWidget {

  final Map arguments;

  const FlutterBasicNavigatorWithRoutesProductStateView(this.arguments, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _FlutterBasicNavigatorWithRoutesProductView(arguments);
  }
}
class _FlutterBasicNavigatorWithRoutesProductView extends State<StatefulWidget> {

  final Map arguments;
  _FlutterBasicNavigatorWithRoutesProductView(this.arguments);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product"),
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