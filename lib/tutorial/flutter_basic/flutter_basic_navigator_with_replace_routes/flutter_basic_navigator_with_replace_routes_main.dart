
import 'package:flutter/material.dart';

import 'flutter_basic_navigator_with_replace_routes_routes.dart';

class FBNWRRMainApp extends StatelessWidget {
  const FBNWRRMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      onGenerateRoute: onGenerateRouteFBNWRR
    );
  }
}
