import 'package:flutter/material.dart';

import 'sub/flutter_basic_navigator_pass_value.dart';
import 'sub/flutter_basic_navigator_search.dart';

void main() {
  runApp(const FlutterBasicSimpleNavigator());
}

class FlutterBasicSimpleNavigator extends StatelessWidget {
  const FlutterBasicSimpleNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _HomeStateView()
    );
  }
}

class _HomeStateView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeView();
  }
}
class _HomeView extends State<StatefulWidget> {

  int _valueCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigator Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const FlutterBasicNavigatorSearch();
                        }
                    )
                  );
                },
                child: const Text("Search")
            ),
            const SizedBox(height: 6,),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        fullscreenDialog: true, // 相当于决定打开方式，true: 苹果的 present, false: 苹果的 push
                        builder: (BuildContext context) {
                          _valueCount++;
                          return FlutterBasicNavigatorPassValue(value: "$_valueCount",);
                        }
                    )
                  );
                },
                child: const Text("Pass value")
            )
          ],
        ),
      ),
    );
  }
}