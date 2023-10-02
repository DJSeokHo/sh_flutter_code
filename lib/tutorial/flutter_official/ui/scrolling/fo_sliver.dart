
import 'package:flutter/material.dart';

void main() {
  runApp(
    _ContentView()
  );
}

class _ContentView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "sliver",
      home: Scaffold(
        body: CustomScrollView(
          slivers: [

            const SliverAppBar(
              title: Text("sliver bar"),
              floating: true,
              flexibleSpace: Placeholder(),
              expandedHeight: 200,
            ),

            SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ListTile(title: Text('Item #$index'));
                  },
                  childCount: 1000
                )
            )

          ],
        ),
      ),
    );
  }
}