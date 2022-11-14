
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:toast/toast.dart';
import 'package:sh_flutter_code/framework/debug/i_log.dart';

class FlutterBasicDialog extends StatelessWidget {
  const FlutterBasicDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dialog Example"),
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
  void initState() {
    super.initState();
    ToastContext().init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _alertDialog(context, () {
                    ILog.debug("??", "close");
                    Navigator.pop(context);
                  }, () {
                    ILog.debug("??", "confirm");
                    Navigator.pop(context);
                  });
                },
                child: const Text("Alert Dialog")
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () {
                    _simpleDialog(context, (result) {
                      ILog.debug("??", result);
                      Navigator.pop(context);
                    });
                  },
                  child: const Text("Simple Dialog")
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () {
                    _bottomActionSheet(context, (result) {
                      ILog.debug("??", result);
                      Navigator.pop(context);
                    });
                  },
                  child: const Text("Bottom Action Sheet")
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () {
                    _toast(context);
                  },
                  child: const Text("Toast")
              ),
              const SizedBox(height: 20,),
            ],
          )
        ],
      ),
    );
  }

  void _alertDialog(BuildContext context, void Function() onClose, void Function() onConfirm) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("alert"),
            content: const Text("this is a message"),
            actions: [
              ElevatedButton(
                child: const Text("close"),
                onPressed: () {
                  onClose();
                },
              ),

              ElevatedButton(
                child: const Text("confirm"),
                onPressed: () {
                  onConfirm();
                },
              ),
            ],
          );
        }
    );
  }

  void _simpleDialog(BuildContext context, void Function(String result) onSelect) async {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text("simple dialog"),
            children: [
              SimpleDialogOption(
                child: const Text("Option A"),
                onPressed: () {
                  onSelect("Option A");
                },
              ),
              SimpleDialogOption(
                child: const Text("Option B"),
                onPressed: () {
                  onSelect("Option B");
                },
              ),
              SimpleDialogOption(
                child: const Text("Option C"),
                onPressed: () {
                  onSelect("Option C");
                },
              )
            ],
          );
        }
    );
  }

  void _bottomActionSheet(BuildContext context, void Function(String result) onSelect) async {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            width: double.infinity,
            height: 150,
            child: Column(
              children: [
                ListTile(
                  title: const Text("aaaaaaaa"),
                  onTap: () {
                    onSelect("aaaaaaaa");
                  },
                ),
                ListTile(
                  title: const Text("bbbbbbbbbbbbb"),
                  onTap: () {
                    onSelect("bbbbbbbbbbbbb");
                  },
                ),
                ListTile(
                  title: const Text("ccccccccccccc"),
                  onTap: () {
                    onSelect("ccccccccccccc");
                  },
                )
              ],
            )
          );
        }
    );
  }

  void _toast(BuildContext context) async {
    ToastContext().init(context);
    Toast.show("Toast plugin app", duration: Toast.lengthShort, gravity:  Toast.bottom);
  }
}


