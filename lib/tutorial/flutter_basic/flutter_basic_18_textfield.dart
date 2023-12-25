import 'package:flutter/material.dart';
import 'package:sh_flutter_code/framework/debug/i_log.dart';

class FlutterBasicTextField extends StatefulWidget {
  const FlutterBasicTextField({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ContentView();
  }
}

class _ContentView extends State<StatefulWidget> {

  static const _tag = "_ContentView";

  final _contentState = TextEditingController();

  @override
  void initState() {
    super.initState();
    _contentState.text = "init value";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("TextField"),
        ),
        body: GestureDetector(
          onTap: () {
            ILog.debug(_tag, "tap???");

            // hide soft keyboard
            FocusScope.of(context).requestFocus(FocusNode());

          },
          child: SingleChildScrollView( // 为了防止键盘遮挡
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    children: [
                      TextField(
                        controller: _contentState,
                      ),
                      const SizedBox(height: 20,),
                      ElevatedButton(onPressed: () {
                        ILog.debug(_tag, _contentState.text);
                      }, child: const Text("print value")),
                      const SizedBox(height: 20,),
                      const TextField(
                        decoration: InputDecoration(
                            hintText: "text place holder",
                            border: OutlineInputBorder(

                            )
                        ),
                      ),
                      const SizedBox(height: 20,),
                      const TextField(
                        maxLines: 4, // 不是说限制在4行，而是显示4行的空间，变成一个多行输入框
                        decoration: InputDecoration(
                            hintText: "text place holder",
                            border: OutlineInputBorder(

                            )
                        ),
                      ),
                      const SizedBox(height: 20,),
                      const TextField(
                        obscureText: true, // 密码
                        decoration: InputDecoration(
                            hintText: "password",
                            border: OutlineInputBorder(

                            )
                        ),
                      ),
                      const SizedBox(height: 20,),
                      const TextField(
                        decoration: InputDecoration(
                            labelText: "label",
                            hintText: "text place holder",
                            border: OutlineInputBorder(

                            )
                        ),
                      ),
                      const SizedBox(height: 20,),
                      const TextField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.people), // 在输入款外面的前面添加一个图标
                            labelText: "label",
                            hintText: "text place holder",
                            border: OutlineInputBorder(

                            )
                        ),
                      )
                    ],
                  ),
                )
            ),
          ),
        ),
      ),
    );
  }

}

void main() {
  runApp(const FlutterBasicTextField());
}