import 'package:a2sv_hub_mobile/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:a2sv_hub_mobile/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import '../widgets/common_app_bar.dart';
import '../widgets/app_drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoaded) {
              return CommonAppBar(
                notificationCount: 3,
                profileImageUrl: 'https://example.com/profile.jpg',
                onMenuPressed: () => Scaffold.of(context).openDrawer(),
              );
            }
            return AppBar(title: Text("Loading..."));
          },
        ),
      ),
      drawer: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoginSuccess) {
            debugPrint(
              "Displaying Name: ${state.name}, Account Status: ${state.accountStatus}",
            );
            return AppDrawer(
              userName: state.name,
              accountStatus: state.accountStatus,
            ); // ✅ Pass both values
          }
          return AppDrawer(userName: "Guest", accountStatus: "Student");
        },
      ),
      body: Center(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return CircularProgressIndicator();
            } else if (state is UserLoaded) {
              debugPrint("HomePage - Displaying Name: ${state.name}");
              return Text(
                "Welcome, ${state.name}!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              );
            } else if (state is UserError) {
              return Text(
                "Error: ${state.message}",
                style: TextStyle(color: Colors.red),
              );
            }
            return Text("Press the menu button to open the drawer.");
          },
        ),
      ),
    );
  }
}
