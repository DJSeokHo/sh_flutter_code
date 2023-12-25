import 'package:flutter/material.dart';

void main() {
  runApp(const ListRefreshItemExample());
}

class ListRefreshItemExample extends StatelessWidget {
  const ListRefreshItemExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ScrollTag Example"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(0),
            children: [
              _ListItemView()
            ]
          ),
        ),
      ),
    );
  }
}

class _ListItemView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListItemViewState();
  }
}

class _ListItemViewState extends State<_ListItemView> {

  bool _expand = false;

  @override
  Widget build(BuildContext context) {
    if (!_expand) {
      return Container(
        width: double.infinity,
        height: 200,
        child: ElevatedButton(
          onPressed: () => {
            setState(() {
              _expand = !_expand;
            })
          },
          child: const Text("Button"),
        ),
      );
    } else {
      return Container(
        width: double.infinity,
        height: 100,
        child: ElevatedButton(
          onPressed: () => {
            setState(() {
              _expand = !_expand;
            })
          },
          child: const Text("Button"),
        ),
      );
    }
  }

}