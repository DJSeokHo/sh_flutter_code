import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(const GridViewWaterfallExample());
}

class GridViewWaterfallExample extends StatelessWidget {
  const GridViewWaterfallExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("GridView Waterfall Example"),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              const SliverToBoxAdapter(
                child: Column(
                  children: [
                    Text("test test"),
                    Text("test test"),
                    Text("test test"),
                    Text("test test"),
                  ],
                ),
              ),
            ];
          },
          body: MasonryGridView.count(
            scrollDirection: Axis.vertical,
            crossAxisCount: 2,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.green,
                height: (index % 5 + 1) * 100,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text('$index'),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}