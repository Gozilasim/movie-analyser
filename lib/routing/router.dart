

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/routing/route_names.dart';

import '../about_us/about_us.dart';

import '../screens/home_page.dart';


Route<dynamic> generateRoute(RouteSettings settings) {

  print('generateRoute: ${settings.name}');
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(HomePage());
    case AboutRoute:
      return _getPageRoute(aboutUs());
    case ContactRoute:
      return _getPageRoute(aboutUs());
    default:
      return _getPageRoute(HomePage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return _FadeRoute(
    child: child,
  );
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  _FadeRoute({required this.child})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    child,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: child,
        ),
  );
}