import 'package:fixtures_app/core/constants/strings/routes_name.dart';
import 'package:fixtures_app/features/fixtures/presentation/screens/home.dart';
import 'package:flutter/material.dart';

class Myroutes {
  Route generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case homePageName:
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(),
        );
    }
  }
}
