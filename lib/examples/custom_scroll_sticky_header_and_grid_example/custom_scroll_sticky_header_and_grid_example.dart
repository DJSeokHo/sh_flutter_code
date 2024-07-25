import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: CustomScrollGridExample()));
}

class CustomScrollGridExample extends StatelessWidget {
  const CustomScrollGridExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar with flexible space
          SliverAppBar(
            backgroundColor: Colors.blue,
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('SliverAppBar'),
              background: Image.network(
                'https://via.placeholder.com/800x400',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // SliverGrid with 2 columns
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Card(
                  color: Colors.teal[100 * ((index % 9) + 1)],
                  child: Center(
                    child: Text(
                      'Item $index',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                );
              },
              childCount: 20,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
