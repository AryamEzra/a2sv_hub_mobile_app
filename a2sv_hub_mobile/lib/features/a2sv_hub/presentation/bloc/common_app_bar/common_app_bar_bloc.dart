import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

part 'common_app_bar_event.dart';
part 'common_app_bar_state.dart';

class CommonAppBarBloc extends Bloc<CommonAppBarEvent, CommonAppBarState> {
  CommonAppBarBloc() : super(CommonAppBarState()) {
    on<FetchUserEmail>(_onFetchUserEmail);
    on<NotificationUpdated>(_onNotificationUpdated);
  }

  Future<void> _onFetchUserEmail(
    FetchUserEmail event,
    Emitter<CommonAppBarState> emit,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final email = prefs.getString(
      'username',
    ); // Fetch email using 'username' key
    emit(state.copyWith(userEmail: email));
  }

  void _onNotificationUpdated(
    NotificationUpdated event,
    Emitter<CommonAppBarState> emit,
  ) {
    emit(state.copyWith(notificationCount: event.newCount));
  }
}
