
import 'package:flutter/material.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_navigator/with_routes/flutter_basic_navigator_pass_value_with_route.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_navigator/sub/flutter_basic_navigator_search.dart';

final routes = {
  '/search': (BuildContext context, {arguments}) {
    return const FlutterBasicNavigatorSearch();
  },
  '/pass_value': (BuildContext context, {arguments}) {
    return FlutterBasicNavigatorPassValueWithRoute(arguments: arguments,);
  },
};

var onGenerateRoute = (RouteSettings settings) {

  final String routeName = settings.name as String;
  final String arguments = settings.arguments as String;

  final Function pageContentBuilder = routes[routeName] as Function;

  if (settings.arguments != null) {
    final Route route = MaterialPageRoute(
        builder: (BuildContext context) {
          return pageContentBuilder(context, arguments: arguments);
        }
    );
    return route;
  }
  else {
    final Route route =
    MaterialPageRoute(builder: (context) => pageContentBuilder(context));
    return route;
  }
};