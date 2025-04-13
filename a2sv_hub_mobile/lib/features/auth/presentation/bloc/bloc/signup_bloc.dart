import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpButtonPressed>(_onSignUp);
  }

  Future<void> _onSignUp(
    SignUpButtonPressed event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpLoading());
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', event.name);
      await prefs.setString('username', event.email);
      await prefs.setBool('isSignedUp', true);
      await prefs.setString('accountStatus', "Student"); // ✅ Store role

      debugPrint("Stored Account Status: Student");

      emit(SignUpSuccess(event.email));
    } catch (e) {
      emit(SignUpFailure("Signup failed"));
    }
  }
}
