import 'package:a2sv_hub_mobile/features/a2sv_hub/domain/entities/problem.dart';
import 'package:a2sv_hub_mobile/features/a2sv_hub/presentation/bloc/bloc/problems_bloc.dart';
import 'package:a2sv_hub_mobile/features/a2sv_hub/presentation/widgets/problem_tiles.dart';
import 'package:a2sv_hub_mobile/features/a2sv_hub/presentation/widgets/problem_tool_bar.dart';
import 'package:a2sv_hub_mobile/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/problems_table.dart';
import '../widgets/app_drawer.dart';
import '../widgets/common_app_bar.dart';

class ProblemsPage extends StatefulWidget {
  @override
  _ProblemsPageState createState() => _ProblemsPageState();
}

class _ProblemsPageState extends State<ProblemsPage> {
  String selectedFilter = "All"; // ✅ Default filter

  @override
  void initState() {
    super.initState();
    context.read<ProblemsBloc>().add(
      FetchProblems(),
    ); // ✅ Ensure problems are fetched
  }

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

      body: Column(
        children: [
          const SizedBox(height: 20),
          const ProblemTitles(),
          const SizedBox(height: 10),
          ProblemToolbar(
            onFilterSelected:
                (filter) => setState(() {
                  selectedFilter = filter;
                }),
          ),
          const SizedBox(height: 10),

          // ✅ Problems Table (Filtered Data)
          Expanded(
            child: BlocBuilder<ProblemsBloc, ProblemsState>(
              builder: (context, state) {
                if (state is ProblemsLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ProblemsLoaded) {
                  List<Problem> filteredProblems =
                      state.problems.where((p) {
                        return selectedFilter == "All" ||
                            p.difficulty == selectedFilter;
                      }).toList();

                  return ProblemsTable(
                    problems: generateExpandedProblems(filteredProblems),
                    onFilterSelected: (filter) {
                      // ✅ Pass the required parameter
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                  );
                } else if (state is ProblemsError) {
                  return Center(child: Text("Error loading problems"));
                }
                return Container(); // ✅ Fallback for unexpected states
              },
            ),
          ),
        ],
      ),
    );
  }
}

List<Problem> generateExpandedProblems(List<Problem> originalProblems) {
  List<Problem> expandedList = [];
  for (int i = 0; i < 10; i++) {
    // ✅ Duplicate 5 times
    expandedList.addAll(originalProblems.map((p) => p.copyWith()));
  }
  expandedList.shuffle(); // ✅ Randomize order
  return expandedList;
}
