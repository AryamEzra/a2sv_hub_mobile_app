import 'package:flutter/material.dart';
import '../../features/auth/presentation/pages/splash_screen.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/sign_up_page.dart';
import '../../features/a2sv_hub/presentation/pages/home_page.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';

  static Map<String, Widget Function(BuildContext)> routes = {
    splash: (context) => SplashScreen(),
    login: (context) => LoginPage(),
    signup: (context) => SignUpPage(),
    home: (context) => HomePage(),
  };
}
