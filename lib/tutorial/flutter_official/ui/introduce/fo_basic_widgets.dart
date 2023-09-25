


import 'package:flutter/material.dart';

void main() {
  runApp(
      const _FOBasicWidgets()
  );
}

class _FOBasicWidgets extends StatelessWidget {
  const _FOBasicWidgets();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"basic widgets",
      home: SafeArea(
          child: _ContentView()
      ),
    );
  }
}

class _ContentView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [

          _TopAppBarView(
            title: Text(
              "Example title",
              style: Theme
                  .of(context)
                  .primaryTextTheme
                  .titleLarge,
            ),
          ),

          const Expanded(child: Center(
            child: Text("Hello, world!"),
          ))
        ],
      ),
    );
  }
}

class _TopAppBarView extends StatelessWidget {
  const _TopAppBarView({required this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.blue[500]
      ),
      child: Row(
        children: [

          const IconButton(
            onPressed: null,
            icon: Icon(Icons.menu),
            tooltip: "Navigation menu",
          ),

          // Expanded会自动填满父组件剩余的空间
          Expanded(child: title),

          const IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
            tooltip: "Search",
          )
        ],
      ),
    );
  }
}