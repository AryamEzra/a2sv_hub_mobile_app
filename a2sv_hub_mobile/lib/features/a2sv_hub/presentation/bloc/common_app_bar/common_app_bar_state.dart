part of 'common_app_bar_bloc.dart';

class CommonAppBarState {
  final int notificationCount;
  final String? userEmail;

  CommonAppBarState({this.notificationCount = 0, this.userEmail});

  CommonAppBarState copyWith({int? notificationCount, String? userEmail}) {
    return CommonAppBarState(
      notificationCount: notificationCount ?? this.notificationCount,
      userEmail: userEmail ?? this.userEmail,
    );
  }
}
