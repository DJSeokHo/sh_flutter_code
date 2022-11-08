import 'package:flutter/material.dart';

class FlutterBasicButtons extends StatelessWidget {
  const FlutterBasicButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          child: const Icon(Icons.add, color: Colors.black, size: 40,),
          onPressed: () {

          },
        ),
        appBar: AppBar(
          title: const Text("Buttons"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.deepOrange,
                  elevation: 20,
                  fixedSize: const Size(200, 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                onPressed: () {

                },
                child: const Text("ElevatedButton")
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: OutlinedButton(
                child: const Text("OutlinedButton"),
                onPressed: () {

                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}