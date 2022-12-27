import 'package:flutter/material.dart';

class ClipOverflowExample extends StatelessWidget {
  const ClipOverflowExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Clip Overflow Example"),
        ),
        body: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            width: double.infinity,
            height: 271,
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                Container(
                  width: double.infinity,
                  height: 271,
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    )
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
