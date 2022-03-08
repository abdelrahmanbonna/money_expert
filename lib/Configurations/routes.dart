import 'package:flutter/material.dart';

import '../Pages/pages.dart';
import 'page_route_names.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.initial:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const Splash(), settings: settings);
      case PageRouteName.landing:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const Landing(), settings: settings);
      case PageRouteName.login:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const Login(), settings: settings);
      case PageRouteName.signUp:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const SignUp(), settings: settings);
      case PageRouteName.forgetPassword:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const ForgetPassword(), settings: settings);
      case PageRouteName.home:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const Home(), settings: settings);
      default:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const Splash(), settings: settings);
    }
  }
}
