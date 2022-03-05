import 'package:flutter/material.dart';

import '../Pages/pages.dart';
import 'page_route_names.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.initial:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const Splash(), settings: settings);
      default:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const Splash(), settings: settings);
    }
  }
}
