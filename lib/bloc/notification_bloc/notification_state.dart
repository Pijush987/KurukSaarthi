part of 'notification_bloc.dart';

 class NotificationState extends Equatable {
  final String notificationData;
  final String message;
  final PostApiStatus postApiStatus;

  NotificationState({this.notificationData = "", this.message = "", this.postApiStatus = PostApiStatus.initial});

  NotificationState copyWith ({
    String? notificationData,
    String? message,
    PostApiStatus? postApiStatus
  }){
    return NotificationState(
        notificationData: notificationData ?? this.notificationData,
        message: message ?? this.message,
        postApiStatus: postApiStatus ?? this.postApiStatus
    );
  }

  @override
  List<Object> get props => [notificationData,message,postApiStatus];
 }