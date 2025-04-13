part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final String name;
  final String accountStatus;

  LoginSuccess(this.name, this.accountStatus);
}

final class LoginFailure extends LoginState {
  final String message;
  LoginFailure(this.message);
}
