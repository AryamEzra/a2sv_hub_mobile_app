import 'package:a2sv_hub_mobile/features/a2sv_hub/presentation/widgets/daily_problem_card.dart';
import 'package:a2sv_hub_mobile/features/a2sv_hub/presentation/widgets/feature_card.dart';
import 'package:a2sv_hub_mobile/features/a2sv_hub/presentation/widgets/upcoming_events_card.dart';
import 'package:a2sv_hub_mobile/features/a2sv_hub/presentation/widgets/welcome_card.dart';
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
                profileImageUrl: 'https://example.com/profile.jpg',
              );
            }
            return AppBar(
              title: Text("Loading..."),
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            );
          },
        ),
      ),
      drawer: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoaded) {
            debugPrint(
              "Drawer - Displaying Name: ${state.name}, Account Status: ${state.accountStatus}",
            );
            return AppDrawer(
              userName: state.name,
              accountStatus: state.accountStatus,
            );
          } else {
            return AppDrawer(userName: "Loading...", accountStatus: "...");
          }
        },
      ),

      backgroundColor: Colors.white,
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UserLoaded) {
            return ListView(
              children: [
                WelcomeCard(
                  quote:
                      "You do not read a book for the book's sake, but for your own.",
                  author: "Earl Nightingale",
                  username: state.name,
                  onProblemsPressed: () => print("Problems button pressed!"),
                ),
                SizedBox(height: 16),
                DailyProblemCard(
                  problemTitle: "Number of Good Leaf Nodes Pairs",
                  difficulty: "Medium",
                  category: "Tree, Depth-First Search, Binary Tree",
                  solvedCount: 158,
                  onSolvePressed: () => print("Solving problem..."),
                  onUpvotePressed: () => print("Upvoted!"),
                  onDownvotePressed: () => print("Downvoted!"),
                ),
                SizedBox(height: 16),
                FeatureCard(), // ✅ Adds mission card
                SizedBox(height: 16),
                UpcomingEventsCard(), // ✅ Adds event section
                SizedBox(height: 16),
              ],
            );
          } else if (state is UserError) {
            return Center(
              child: Text(
                "Error: ${state.message}",
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          return Center(child: Text("Loading user data..."));
        },
      ),
    );
  }
}
