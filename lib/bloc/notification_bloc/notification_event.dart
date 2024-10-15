part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable{
  const NotificationEvent();

  @override
  List<Object> get props => [];

}

class SaveNotificationData extends NotificationEvent{
  final String notificationData;

  const SaveNotificationData({required this.notificationData});

  @override
  List<Object> get props => [notificationData];
}

class StatusChange extends NotificationEvent{
  final PostApiStatus postApiStatus;

  const StatusChange({required this.postApiStatus});

  @override
  List<Object> get props => [postApiStatus];
}

class NotificationsApi extends NotificationEvent{}