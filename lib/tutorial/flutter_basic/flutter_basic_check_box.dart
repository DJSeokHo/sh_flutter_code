
import 'package:flutter/material.dart';

class FlutterBasicCheckBox extends StatefulWidget {
  const FlutterBasicCheckBox({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ContentView();
  }
}

class _ContentView extends State<StatefulWidget> {

  var flag = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Check Box"),
        ),
        body: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: flag,
                    onChanged: (value) {

                      if (value != null) {
                        setState(() {
                          flag = value;
                        });
                      }
                    },
                    activeColor: Colors.deepOrange,
                  ),

                  Text("flag is $flag")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}