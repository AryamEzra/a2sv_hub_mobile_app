part of 'common_app_bar_bloc.dart';

abstract class CommonAppBarEvent {}

class NotificationUpdated extends CommonAppBarEvent {
  final int newCount;

  NotificationUpdated(this.newCount);
}

class FetchUserEmail extends CommonAppBarEvent {}
