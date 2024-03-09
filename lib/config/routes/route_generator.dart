import 'package:ds_app/config/routes/routes.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  RouteGenerator._();

  static String currentRoute = Routes.login;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    currentRoute = settings.name!;

    switch (currentRoute) {
      case Routes.login:
        return MaterialPageRoute(builder: (context) => Placeholder());
      case Routes.formular:
        return MaterialPageRoute(builder: (context) => Placeholder());
      case Routes.formularVerwaltung:
        return MaterialPageRoute(builder: (context) => Placeholder());
      default:
        return MaterialPageRoute(builder: (context) => Placeholder());
    }
  }
}
