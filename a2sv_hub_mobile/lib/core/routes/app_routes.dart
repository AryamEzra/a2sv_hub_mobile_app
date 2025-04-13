import 'package:flutter/material.dart';
import '../../features/a2sv_hub/presentation/pages/home_page.dart';

class AppRoutes {
  static const String home = '/home';

  static Map<String, Widget Function(BuildContext)> routes = {
    home: (context) => HomePage(),
  };
}
