part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserLoaded extends UserState {
  final String name;
  final String accountStatus;

  UserLoaded(this.name, this.accountStatus);
}

final class UserLoadedList extends UserState {
  final List<UserEntity> users;
  UserLoadedList(this.users);
}

final class UserError extends UserState {
  final String message;
  UserError(this.message);
}
