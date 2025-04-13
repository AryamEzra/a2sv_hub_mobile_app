import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:a2sv_hub_mobile/features/user/data/repositories/user_repository_impl.dart';
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
      drawer: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoaded) {
            return AppDrawer(userName: state.user.name);
          }
          return AppDrawer(userName: "Guest");
        },
      ),
      body: Center(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return CircularProgressIndicator();
            } else if (state is UserLoaded) {
              return Text("Welcome, ${state.user.name}!");
            } else if (state is UserError) {
              return Text("Error: ${state.message}");
            }
            return Text("Press the menu button to open the drawer.");
          },
        ),
      ),
    );
  }
}
