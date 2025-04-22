import 'package:a2sv_hub_mobile/features/a2sv_hub/presentation/bloc/problems/problems_bloc.dart';
import 'package:a2sv_hub_mobile/features/auth/presentation/bloc/signup/signup_bloc.dart';
import 'package:a2sv_hub_mobile/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:a2sv_hub_mobile/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/routes/app_routes.dart';
import 'features/user/data/repositories/user_repository_impl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create:
              (context) =>
                  UserBloc(UserRepositoryImpl())..add(LoadCurrentUser()),
        ),
        BlocProvider<ProblemsBloc>(
          create: (context) => ProblemsBloc()..add(FetchProblems()),
        ),
        BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
        BlocProvider<SignUpBloc>(create: (context) => SignUpBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute:
            AppRoutes.splash, // Start with splash screen for better UX
        routes: AppRoutes.routes,
      ),
    );
  }
}
