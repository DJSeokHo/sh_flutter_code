
import 'package:flutter/material.dart';

void main() {
  runApp(const PhysicalBackPressHandlerExample());
}

class PhysicalBackPressHandlerExample extends StatelessWidget {
  const PhysicalBackPressHandlerExample({super.key});

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
      appBar: AppBar(
        title: const Text("Physical Back Press Handler Example"),
        centerTitle: true, // 无论在什么机器上，标题都居中显示
        backgroundColor: Colors.deepOrange,
        // leading: const Icon(Icons.menu), // Icon 无法点击
        actions: [
          IconButton(
            icon: const Icon(Icons.next_plan),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => _SubView(),
                    fullscreenDialog: false
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
                "Hello",
                style: TextStyle(
                    color: Colors.white
                )
            ),
            ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => _SubView(),
                        fullscreenDialog: false
                    ),
                  )
                }, child: const Text(
                "next"
            )
            )
          ],
        ),
      ),
    );
  }
}

class _SubView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
                "Hello",
                style: TextStyle(
                    color: Colors.white
                )
            ),
            ElevatedButton(
                onPressed: () => {
                  Navigator.pop(context)
                }, child: const Text(
                "back"
            )
            )
          ],
        ),
      ),
    );
  }

}