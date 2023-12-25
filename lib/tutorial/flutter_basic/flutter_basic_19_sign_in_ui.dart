import 'package:flutter/material.dart';
import 'package:sh_flutter_code/framework/debug/i_log.dart';

class FlutterBasicSignInUI extends StatefulWidget {
  const FlutterBasicSignInUI({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ContentView();
  }
}

class _ContentView extends State<StatefulWidget> {

  static const _tag = "_ContentView";

  final _idState = TextEditingController();
  final _passwordState = TextEditingController();

  @override
  void initState() {
    super.initState();

    _idState.text = "";
    _passwordState.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sign In UI",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Sign In UI"),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
        ),
        body: GestureDetector(
          onTap: () {
            // hide soft keyboard
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            color: Colors.white,
            width: double.infinity, // 和父组件一样宽度
            height: double.infinity, // 和父组件一样宽高度
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const SizedBox(height: 20,),

                    TextField(
                      controller: _idState,
                      onChanged: (value) {
                        ILog.debug(_tag, "onChanged $value");

                        if (value.contains(" ")) {
                          // 禁止输入空格
                          setState(() {
                            _idState.text = value.replaceAll(" ", ""); // 去掉空格
                            _idState.selection = TextSelection.fromPosition(TextPosition(offset: _idState.text.length)); // 后移光标到末端
                          });
                        }

                      },
                      onEditingComplete: () {
                        ILog.debug(_tag, "onEditingComplete");
                        // hide soft keyboard
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      decoration: const InputDecoration(
                        labelText: "Nickname",
                        hintText: "Input nickname please",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        )
                      ),
                    ),

                    const SizedBox(height: 8,),

                    TextField(
                      controller: _passwordState,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        hintText: "Input password please",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                        )
                      ),
                    ),

                    const SizedBox(height: 20,),

                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            ILog.debug(_tag, "id is ${_idState.text}, password is ${_passwordState.text}");
                          },
                          child: const Text("Sign In")
                        ),

                        const SizedBox(width: 10,),

                        ElevatedButton(
                          onPressed: () {

                          },
                          child: const Text("Sign Up")
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}

void main() {
  runApp(const FlutterBasicSignInUI());
}