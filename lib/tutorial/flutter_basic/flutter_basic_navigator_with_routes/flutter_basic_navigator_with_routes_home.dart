
import 'package:flutter/material.dart';

class FlutterBasicNavigatorWithRoutesHomeStateView extends StatefulWidget {
  const FlutterBasicNavigatorWithRoutesHomeStateView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FlutterBasicNavigatorWithRoutesHomeView();
  }
}
class _FlutterBasicNavigatorWithRoutesHomeView extends State<StatefulWidget> {

  int _valueCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigator with route path"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/search'
                  );
                },
                child: const Text("Search")
            ),
            const SizedBox(height: 6,),
            ElevatedButton(
                onPressed: () {

                  _valueCount++;

                  Navigator.pushNamed(
                    context,
                    '/pass_value',
                    arguments: {"value": _valueCount}
                  );
                },
                child: const Text("Pass value")
            ),
            const SizedBox(height: 6,),
            ElevatedButton(
                onPressed: () {

                  _valueCount++;

                  Navigator.pushNamed(
                    context,
                    '/product',
                    arguments: {"value": _valueCount}
                  );
                },
                child: const Text("Product")
            )
          ],
        ),
      ),
    );
  }

}