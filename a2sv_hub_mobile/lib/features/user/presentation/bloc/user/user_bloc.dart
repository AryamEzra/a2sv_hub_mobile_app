import 'package:a2sv_hub_mobile/features/user/domain/entities/user_entity.dart';
import 'package:a2sv_hub_mobile/features/user/domain/repositories/user_repository.dart';
import 'package:a2sv_hub_mobile/features/user/domain/use_cases/get_user_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserInitial()) {
    on<LoadUsers>(_onLoadUsers);
    on<LoadCurrentUser>(_onLoadCurrentUser);
  }

  /// Fetches a list of users
  Future<void> _onLoadUsers(LoadUsers event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final users = await userRepository.getUsers(); // Call repository directly
      emit(UserLoadedList(users)); // Emits a list of users
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  /// Fetches the current logged-in user
  Future<void> _onLoadCurrentUser(
    LoadCurrentUser event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final username = prefs.getString('username') ?? "Guest";

      final mockUser = UserEntity(
        id: 1,
        name: username,
        email: "guest@example.com",
      );

      emit(UserLoaded(mockUser)); // Correctly emits a single user
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
