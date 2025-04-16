import 'package:a2sv_hub_mobile/features/a2sv_hub/domain/entities/problem.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'problems_event.dart';
part 'problems_state.dart';

class ProblemsBloc extends Bloc<ProblemsEvent, ProblemsState> {
  ProblemsBloc() : super(ProblemsLoading()) {
    on<FetchProblems>((event, emit) async {
      try {
        print("🚀 Fetching problems from JSON...");

        List<Problem> problems = await Problem.loadProblems(); // ✅ Load JSON

        if (problems.isEmpty) {
          print("⚠ Warning: No problems found in JSON!");
        } else {
          print("✅ Loaded ${problems.length} problems successfully!");
        }

        emit(ProblemsLoaded(problems));
      } catch (e) {
        print("❌ Error loading problems: $e"); // ✅ Debug error
        emit(ProblemsError("Failed to load problems."));
      }
    });

    on<UpvoteProblem>((event, emit) {
      if (state is ProblemsLoaded) {
        final updatedProblems =
            (state as ProblemsLoaded).problems.map((problem) {
              return problem.id == event.id
                  ? problem.copyWith(votes: problem.votes + 1)
                  : problem;
            }).toList();
        emit(ProblemsLoaded(updatedProblems));
      }
    });

    on<DownvoteProblem>((event, emit) {
      if (state is ProblemsLoaded) {
        final updatedProblems =
            (state as ProblemsLoaded).problems.map((problem) {
              return problem.id == event.id
                  ? problem.copyWith(votes: problem.votes - 1)
                  : problem;
            }).toList();
        emit(ProblemsLoaded(updatedProblems));
      }
    });
  }
}
