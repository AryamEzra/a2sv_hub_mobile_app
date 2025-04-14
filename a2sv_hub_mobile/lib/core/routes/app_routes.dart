import 'package:a2sv_hub_mobile/features/a2sv_hub/presentation/pages/problem_page.dart';
import 'package:a2sv_hub_mobile/features/a2sv_hub/presentation/pages/tracks_page.dart';
import 'package:a2sv_hub_mobile/features/a2sv_hub/presentation/widgets/progress_card.dart';
import 'package:a2sv_hub_mobile/features/a2sv_hub/presentation/widgets/stats_card.dart';
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
  static const String tracks = '/tracks';
  static const String trackDetails = '/trackDetails';
  static const String statsDetails = '/statsDetails';
  static const String problems = '/problems';

  static Map<String, Widget Function(BuildContext)> routes = {
    splash: (context) => SplashScreen(),
    login: (context) => LoginPage(),
    signup: (context) => SignUpPage(),
    home: (context) => HomePage(),
    tracks: (context) => TracksPage(),
    trackDetails: (context) => ProgressCard(),
    statsDetails: (context) => StatsCard(),
    problems: (context) => ProblemsPage(),
  };
}
