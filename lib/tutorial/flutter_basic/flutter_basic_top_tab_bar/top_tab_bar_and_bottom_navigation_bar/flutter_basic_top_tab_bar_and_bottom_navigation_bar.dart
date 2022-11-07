

import 'package:flutter/material.dart';

import '../../../../framework/debug/i_log.dart';
import 'fbttbabnb_sub_normal.dart';
import 'fbttbabnb_sub_top_tab_bar.dart';

const _tag = "FlutterBasicTopTabBarAndBottomNavigationBar";

class FlutterBasicTopTabBarAndBottomNavigationBar extends StatefulWidget {
  const FlutterBasicTopTabBarAndBottomNavigationBar({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ContentView();
  }
}

class _ContentView extends State<StatefulWidget> {

  int _currentIndex = 0;

  final List _subViewList = [
    const FBTTBABMBSubTopTabBar(),
    const FBTTBABMBSubNormal()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _subViewList[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          // type: BottomNavigationBarType.shifting, // 用于底部按钮较多的情况
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey,
          onTap: (int index) {
            ILog.debug(_tag, "onTap $index");
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: "TopTab"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: "Normal"
            )
          ],
        ),
      ),
    );
  }

}