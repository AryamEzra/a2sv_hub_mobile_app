import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLogin);
  }

  Future<void> _onLogin(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      final name = prefs.getString('name'); // ✅ Get stored name
      final accountStatus =
          prefs.getString('accountStatus') ??
          "Student"; // ✅ Get stored account status

      debugPrint("Retrieved Name After Login: $name");
      debugPrint("Retrieved Account Status After Login: $accountStatus");

      if (name != null) {
        emit(LoginSuccess(name, accountStatus)); // ✅ Pass both name & status
      } else {
        emit(LoginFailure("Login failed: Name not found"));
      }
    } catch (e) {
      emit(LoginFailure("Login failed"));
    }
  }
}
