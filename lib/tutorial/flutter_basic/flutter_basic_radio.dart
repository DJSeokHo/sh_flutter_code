
import 'package:flutter/material.dart';

class FlutterBasicRadio extends StatefulWidget {
  const FlutterBasicRadio({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ContentView();
  }
}

class _ContentView extends State<StatefulWidget> {

  var _gender = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Radio Example"),
        ),
        body: Column(
          children: [
            Row(
              children: [
                const Text("Male"),
                Radio(
                  value: 1,
                  groupValue: _gender,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _gender = value;
                      });
                    }
                  }
                ),

                const SizedBox(width: 20,),

                const Text("Female"),
                Radio(
                    value: 2,
                    groupValue: _gender,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _gender = value;
                        });
                      }
                    }
                )
              ],
            ),
            Text(_gender == 1 ? "Male" : "Female"),

            const SizedBox(height: 30,),

            RadioListTile(
              value: 3,
              groupValue: _gender,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _gender = value;
                  });
                }
              },
              title: const Text("title"),
              subtitle: const Text("subtitle"),
              secondary: const Icon(Icons.help),
              selectedTileColor: Colors.deepOrange, // 选中时的背景颜色
              selected: _gender != 1, //选中条件
              activeColor: Colors.white, // 选中时的内容颜色
            )
          ],
        ),
      ),
    );
  }

}