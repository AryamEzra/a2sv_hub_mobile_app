part of 'problems_bloc.dart';

sealed class ProblemsEvent extends Equatable {
  const ProblemsEvent();

  @override
  List<Object> get props => [];
}

class FetchProblems extends ProblemsEvent {} // ✅ Event to load problems

class UpvoteProblem extends ProblemsEvent {
  final String id;
  UpvoteProblem(this.id);

  @override
  List<Object> get props => [id]; // ✅ Ensure event equality
}

class DownvoteProblem extends ProblemsEvent {
  final String id;
  DownvoteProblem(this.id);

  @override
  List<Object> get props => [id]; // ✅ Ensure event equality
}
