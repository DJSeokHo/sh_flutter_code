import 'package:flutter/material.dart';

class CustomDialog extends Dialog {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child:  Container(
          width: 300,
          height: 300,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: 300,
                height: 40,
                child: Stack(
                  children: const [
                    Align(
                      alignment: Alignment.center,
                      child: Text("About Us"),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        child: Icon(Icons.close),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                height: 1,
                color: Colors.black,
              ),
              Container(
                alignment: Alignment.topCenter,
                width: 300,
                height: 259,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text("Custom Dialog"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}