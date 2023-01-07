import 'package:flutter/material.dart';

class NavigatorWithoutRouteExample extends StatelessWidget {
  const NavigatorWithoutRouteExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _ContentView(),
    );
  }
}

class _ContentView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: const Center(
          child: Text(
            "Hello",
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }

}