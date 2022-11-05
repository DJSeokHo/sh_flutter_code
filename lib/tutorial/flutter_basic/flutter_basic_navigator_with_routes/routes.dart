
import 'package:flutter/material.dart';
import 'package:sh_flutter_code/framework/debug/i_log.dart';
import 'package:sh_flutter_code/tutorial/flutter_basic/flutter_basic_navigator_with_routes/flutter_basic_navigator_with_routes_pass_value.dart';

import 'flutter_basic_navigator_with_routes_home.dart';
import 'flutter_basic_navigator_with_routes_product.dart';
import 'flutter_basic_navigator_with_routes_search.dart';

const _tag = "routes";

final _routes = {
  '/': (BuildContext context) {
    return const FlutterBasicNavigatorWithRoutesHomeStateView();
  },
  '/search': (BuildContext context) {
    return const FlutterBasicNavigatorWithRoutesSearchView();
  },
  '/pass_value': (BuildContext context, {arguments}) {
    return FlutterBasicNavigatorWithRoutePassValueView(arguments);
  },
  '/product': (BuildContext context, {arguments}) {
    return FlutterBasicNavigatorWithRoutesProductStateView(arguments);
  },
};

var onGenerateRoute = (RouteSettings settings) {

  final String routeName = settings.name as String;
  ILog.debug(_tag, "content ${settings.arguments}");
  final Function pageContentBuilder = _routes[routeName] as Function;

  final Route route = MaterialPageRoute(
      builder: (BuildContext context) {

        if (settings.arguments != null) {
          final Map arguments = settings.arguments as Map;
          return pageContentBuilder(context, arguments: arguments);
        }
        else {
          return pageContentBuilder(context);
        }

      }
  );
  return route;

};