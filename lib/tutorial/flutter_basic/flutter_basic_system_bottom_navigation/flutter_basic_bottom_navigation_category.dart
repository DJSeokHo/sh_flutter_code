
import 'package:flutter/material.dart';

class FlutterBasicBNCategoryViewState extends StatefulWidget {
  const FlutterBasicBNCategoryViewState({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FlutterBasicBNCategoryView();
  }
}
class _FlutterBasicBNCategoryView extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Category", style: TextStyle(fontSize: 40, color: Colors.black),),
    );
  }
}