
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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Center(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: MasonryGridView.count(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Container(
                      color: Colors.green,
                      height: (index % 5 + 1) * 100,
                      child: Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text('$index'),
                        ),
                      )
                  );
                },
              ),
            ),
          ),
        )
      ),
    );
  }

}