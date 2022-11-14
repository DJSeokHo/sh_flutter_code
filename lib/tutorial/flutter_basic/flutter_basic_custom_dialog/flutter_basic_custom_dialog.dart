
import 'package:flutter/material.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_custom_dialog/custom_dialog.dart';

class FlutterBasicCustomDialog extends StatelessWidget {
  const FlutterBasicCustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom Dialog Example"),
        ),
        body: _ContentStateView(),
      )
    );
  }
}

class _ContentStateView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContentView();
  }
}

class _ContentView extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Center(
        child: ElevatedButton(
            onPressed: () {
              _customDialog(context);
            },
            child: const Text("Alert Dialog")
        ),
      ),
    );
  }

  void _customDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const CustomDialog(

          );
        }
    );
  }
}