import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kuruk_saarthi/repository/notification_api/notification_api_repository.dart';
import 'package:kuruk_saarthi/services/session_manager/session_controller.dart';
import 'package:kuruk_saarthi/utils/enums.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationApiRepository notificationApiRepository;

  NotificationBloc({required this.notificationApiRepository}) : super(NotificationState()) {
    on<SaveNotificationData>(_onSaveNotificationData);
    on<NotificationsApi>(_onNotification);
    on<StatusChange>(_statusChange);
  }

  void _onSaveNotificationData(SaveNotificationData event, Emitter<NotificationState> emit){
    emit(
      state.copyWith(
          notificationData:event.notificationData
      ),
    );
  }

  void _statusChange(StatusChange event, Emitter<NotificationState> emit){
    emit(
      state.copyWith(
          postApiStatus:event.postApiStatus
      ),
    );
  }


  void _onNotification(NotificationsApi event, Emitter<NotificationState> emit) async{
    final token = await SessionController().sharedPreferenceClass.readValue('token');

    Map<String, dynamic> newToken = jsonDecode(token) ;

    Map <String, String> headers = {
      'Authorization': 'Bearer ${newToken['token']}'
    };

    Map<String,dynamic> data = {
      "content":state.notificationData.toString()
    };
    emit(state.copyWith(postApiStatus: PostApiStatus.loading));

    await notificationApiRepository.notificationApi(data: data,header: headers).then((value)async{
      log("value  $value");
      if(value['success'] == false && value['code']==420){
        await SessionController().removeUserInPreference();
        await SessionController().getUserFromPreference();
        print("Authentication failed. Try logging in again");
        emit(state.copyWith(postApiStatus: PostApiStatus.error, message: "420"));
      }
      else if(value['success'] == false){
        emit(state.copyWith(postApiStatus: PostApiStatus.error, message: 'Send notification failed'));
      }else{
        emit(state.copyWith(postApiStatus: PostApiStatus.success,message: "Send notification successfully"));
      }
    }).onError((error,stackTrace){
      emit(state.copyWith(postApiStatus: PostApiStatus.error, message: error.toString()));
    });
  }

}
