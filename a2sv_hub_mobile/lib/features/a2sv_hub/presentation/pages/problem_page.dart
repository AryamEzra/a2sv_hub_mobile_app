import 'package:a2sv_hub_mobile/features/a2sv_hub/domain/entities/problem.dart';
import 'package:a2sv_hub_mobile/features/a2sv_hub/presentation/bloc/bloc/problems_bloc.dart';
import 'package:a2sv_hub_mobile/features/a2sv_hub/presentation/widgets/app_drawer.dart';
import 'package:a2sv_hub_mobile/features/a2sv_hub/presentation/widgets/common_app_bar.dart';
import 'package:a2sv_hub_mobile/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/problem_card.dart';

class ProblemsPage extends StatefulWidget {
  @override
  _ProblemsPageState createState() => _ProblemsPageState();
}

class _ProblemsPageState extends State<ProblemsPage> {
  Problem? selectedProblem; // ✅ Stores clicked problem

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        notificationCount: 5,
        profileImageUrl: "https://via.placeholder.com/150",
        onMenuPressed: () => Scaffold.of(context).openDrawer(),
        onSearchPressed: () => print("Search pressed"),
        onSparklePressed: () => print("Sparkle pressed"),
        onNotificationPressed: () => print("Notification pressed"),
      ),
      drawer: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoaded) {
            return AppDrawer(
              userName: state.name,
              accountStatus: state.accountStatus,
            );
          }
          return AppDrawer(userName: "Loading...", accountStatus: "...");
        },
      ),
      body: BlocBuilder<ProblemsBloc, ProblemsState>(
        builder: (context, state) {
          if (state is ProblemsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProblemsLoaded) {
            return ListView.builder(
              itemCount: state.problems.length,
              itemBuilder: (context, index) {
                final problem = state.problems[index];
                return ProblemCard(
                  problem: problem,
                  onOpenDetails:
                      () => setState(() {
                        selectedProblem = problem; // ✅ Update selected problem
                      }),
                  onVoteUp: () {
                    context.read<ProblemsBloc>().add(UpvoteProblem(problem.id));
                  },
                  onVoteDown:
                      () => context.read<ProblemsBloc>().add(
                        DownvoteProblem(problem.id),
                      ),
                );
              },
            );
          } else if (state is ProblemsError) {
            return Center(child: Text("Error loading problems"));
          }
          return Container(); // Fallback for other states
        },
      ),
    );
  }
}
