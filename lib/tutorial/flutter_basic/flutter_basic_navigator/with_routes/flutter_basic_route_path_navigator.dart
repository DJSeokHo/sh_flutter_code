
import 'package:flutter/material.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_navigator/with_routes/routes.dart';

class FlutterBasicRoutePathNavigatorExample extends StatelessWidget {

  static const tag = "FlutterBasicRoutePathNavigatorExample";

  const FlutterBasicRoutePathNavigatorExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: onGenerateRoute,
      home: _HomeStateView(),
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
                    '/search',
                    arguments: ""
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
                    arguments: "$_valueCount"
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