
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: CurvedBottomNavigationBarExampleView(),));
}

class CurvedBottomNavigationBarExampleView extends StatefulWidget {
  const CurvedBottomNavigationBarExampleView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CurvedBottomNavigationBarExampleViewState();
  }
}

class _CurvedBottomNavigationBarExampleViewState extends State<CurvedBottomNavigationBarExampleView> {

  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 200),
        key: _bottomNavigationKey,
        items: const <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: Container(
        color: Colors.blueAccent,
        child: Center(
          child: Column(
            children: <Widget>[
              Text(_page.toString(), textScaler: const TextScaler.linear(10.0)),
              ElevatedButton(
                child: const Text('Go To Page of index 1'),
                onPressed: () {
                  //Page change using state does the same as clicking index 1 navigation button
                  final CurvedNavigationBarState? navBarState = _bottomNavigationKey.currentState;
                  navBarState?.setPage(1);
                },
              )
            ],
          ),
        ),
      )
    );
  }

}