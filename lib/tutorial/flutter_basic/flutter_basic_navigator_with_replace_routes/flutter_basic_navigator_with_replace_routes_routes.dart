
import 'package:flutter/material.dart';
import 'package:sh_flutter_code/framework/debug/i_log.dart';

import 'flutter_basic_navigator_with_replace_routes_home.dart';
import 'flutter_basic_navigator_with_replace_routes_sign_in.dart';
import 'flutter_basic_navigator_with_replace_routes_sign_up_auth.dart';
import 'flutter_basic_navigator_with_replace_routes_sign_up_info.dart';

const _tag = "routes";

final _routes = {
  '/': (BuildContext context) {
    return const FBNWRRHomeStateView();
  },
  '/sign_in': (BuildContext context) {
    return const FBNWRRSignInView();
  },
  '/sign_up_auth': (BuildContext context) {
    return const FBNWRRSignUpAuthView();
  },
  '/sign_up_info': (BuildContext context) {
    return const FBNWRRSignUpInfoView();
  },
};

var onGenerateRouteFBNWRR = (RouteSettings settings) {

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