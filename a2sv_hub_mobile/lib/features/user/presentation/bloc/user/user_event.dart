part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

final class LoadUsers extends UserEvent {}

final class LoadCurrentUser extends UserEvent {}
