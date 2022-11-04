
import 'package:flutter/material.dart';

class FlutterBasicBNSettingsViewState extends StatefulWidget {
  const FlutterBasicBNSettingsViewState({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FlutterBasicBNSettingsView();
  }
}
class _FlutterBasicBNSettingsView extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Settings", style: TextStyle(fontSize: 40, color: Colors.black),),
    );
  }
}