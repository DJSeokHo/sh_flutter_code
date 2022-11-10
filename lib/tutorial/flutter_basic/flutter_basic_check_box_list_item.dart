
import 'package:flutter/material.dart';

class FlutterBasicCheckBoxListItem extends StatefulWidget {
  const FlutterBasicCheckBoxListItem({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ContentView();
  }
}

class _ContentView extends State<StatefulWidget> {

  var _flag = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Check box list item"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CheckboxListTile(
                value: _flag,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _flag = value;
                    });
                  }
                },
                title: const Text("title"),
                subtitle: const Text("subtitle"),
                secondary: const Icon(Icons.help),
              )
            ],
          ),
        ),
      ),
    );
  }

}