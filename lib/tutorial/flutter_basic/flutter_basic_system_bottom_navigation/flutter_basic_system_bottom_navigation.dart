
import 'package:flutter/material.dart';
import 'package:sh_flutter_code/framework/debug/i_log.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_system_bottom_navigation/flutter_basic_bottom_navigation_category.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_system_bottom_navigation/flutter_basic_bottom_navigation_settings.dart';

import 'flutter_basic_bottom_navigation_home.dart';

class FlutterBasicSystemBottomNavigationBarExample extends StatelessWidget {
  const FlutterBasicSystemBottomNavigationBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _ContentViewState(),
    );
  }
}

class _ContentViewState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContentView();
  }
}
class _ContentView extends State<StatefulWidget> {

  static const tag = "_ContentView";

  int _currentIndex = 0;

  final List _subViewList = [
    const FlutterBasicBNHomeViewState(),
    const FlutterBasicBNCategoryViewState(),
    const FlutterBasicBNSettingsViewState()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Navigation Bar Example"),
      ),
      body: _subViewList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        // type: BottomNavigationBarType.shifting, // 用于底部按钮较多的情况
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          ILog.debug(tag, "onTap $index");
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Category"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings"
          )
        ],
      ),
    );
  }
}