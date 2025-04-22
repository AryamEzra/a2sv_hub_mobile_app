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
  final String email;

  LoginSuccess(this.name, this.accountStatus, this.email);
}

final class LoginFailure extends LoginState {
  final String message;
  LoginFailure(this.message);
}
