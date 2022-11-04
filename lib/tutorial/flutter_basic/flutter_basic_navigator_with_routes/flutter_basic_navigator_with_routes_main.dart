
import 'package:flutter/material.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_navigator_with_routes/routes.dart';

class FlutterBasicNavigatorWithRoutesMain extends StatelessWidget {

  static const tag = "FlutterBasicNavigatorWithRoutesMain";

  const FlutterBasicNavigatorWithRoutesMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      onGenerateRoute: onGenerateRoute,
    );
  }
}
