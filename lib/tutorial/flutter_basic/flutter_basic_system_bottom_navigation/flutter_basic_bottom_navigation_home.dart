
import 'package:flutter/material.dart';

class FlutterBasicBNHomeViewState extends StatefulWidget {
  const FlutterBasicBNHomeViewState({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FlutterBasicBNHomeView();
  }
}
class _FlutterBasicBNHomeView extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Home", style: TextStyle(fontSize: 40, color: Colors.black),),
    );
  }
}