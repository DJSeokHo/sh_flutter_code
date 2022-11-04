
import 'package:flutter/material.dart';

class FlutterBasicNavigatorWithRoutesSearchView extends StatelessWidget {
  const FlutterBasicNavigatorWithRoutesSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: const Center(
        child: Text("Search Page"),
      ),
    );
  }
}
