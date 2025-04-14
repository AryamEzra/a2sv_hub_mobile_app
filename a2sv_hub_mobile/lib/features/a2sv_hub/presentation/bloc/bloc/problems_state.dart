part of 'problems_bloc.dart';

sealed class ProblemsState extends Equatable {
  const ProblemsState();

  @override
  List<Object> get props => [];
}

class ProblemsLoading extends ProblemsState {} // ✅ Loading state

class ProblemsLoaded extends ProblemsState {
  final List<Problem> problems;
  ProblemsLoaded(this.problems);

  @override
  List<Object> get props => [problems]; // ✅ Ensure state equality
}

class ProblemsError extends ProblemsState {
  final String message;
  ProblemsError(this.message);

  @override
  List<Object> get props => [message]; // ✅ Ensure state equality
}
