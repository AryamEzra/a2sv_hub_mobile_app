part of 'signup_bloc.dart';

sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final String email;
  SignUpSuccess(this.email);
}

final class SignUpFailure extends SignUpState {
  final String message;
  SignUpFailure(this.message);
}
