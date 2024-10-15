import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jiffy/jiffy.dart';
import 'package:kuruk_saarthi/model/voter_list_model/dart/voter_list_model.dart';
import 'package:kuruk_saarthi/repository/voter_list_api/voter_api_repository.dart';
import 'package:kuruk_saarthi/services/database/database_services.dart';
import 'package:kuruk_saarthi/services/session_manager/session_controller.dart';
import 'package:kuruk_saarthi/utils/const.dart';
import 'package:kuruk_saarthi/utils/enums.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  VoterListApiRepository voterListApiRepository;
  DatabaseHelper databaseHelper = DatabaseHelper();

  HomeBloc({required this.voterListApiRepository}) : super(const HomeState()) {
    on<LanguagePopupWindowChange>(_onCurrentIndexChange);
    on<FetchVoterList>(_onFetchVoterList);
    on<HomeStatusChange>(_statusChange);
  }

  void _onCurrentIndexChange(LanguagePopupWindowChange event, Emitter<HomeState> emit){
    emit(
      state.copyWith(
          openLanguagePopup:event.openLanguagePopup
      ),
    );
  }

  void _statusChange(HomeStatusChange event, Emitter<HomeState> emit){
    emit(
      state.copyWith(
          postApiStatus:event.postApiStatus
      ),
    );
  }

  Future<VoterListModel> getAllData(Map<String,dynamic> data,Map <String, String> headers,emit)async{
    VoterListModel voterListModel=  await voterListApiRepository.voterListApi(queryParams: data,header: headers);
    return voterListModel;
  }


  void _onFetchVoterList(FetchVoterList event, Emitter<HomeState> emit) async{
    await SessionController().sharedPreferenceClass.readValue('token').then((onValue) async{
      int count = 0;
      bool flag = false;
      int limit = 10000;
      int totalLoopCount = 0;
      emit(state.copyWith(postApiStatus: PostApiStatus.loading));

      await SessionController().sharedPreferenceClass.readValue('count').then((value)async{
        debugPrint("count    %%%%  $value");
        if(value == null){
          count = 1;
        }else{
          count = int.parse(value.toString());
        }
        debugPrint("count    %%%%  $count");
      });



      if(onValue == null && onValue.toString() .isEmpty){
        debugPrint("empty token $onValue");
        return;
      }
      else{
          Map <String, dynamic> token = jsonDecode(onValue) ;
          Map <String, String> headers = {
            'Content-Type' : 'application/json',
            'Authorization' : 'Bearer ${token['token']}'
          };

            Map<String,dynamic> data = {
              "limit":limit.toString(),
              "page":count.toString(),
            };
           await getAllData(data,headers,emit).then((value)async{
             debugPrint("total count 1");
              if(value.success == false  && value.message.isNotEmpty){
                emit(state.copyWith(postApiStatus: PostApiStatus.error, message: value.message));
              }else{
                debugPrint("total count 2");
                await databaseHelper.saveApiData(value);
                totalLoopCount =  (value.count/limit).ceil();
                debugPrint("total count $totalLoopCount");
                await SessionController().saveTotalCount(count+1);
                await SessionController().getTotalCount();

                await SessionController().saveTotalVoters(value.count);
                await SessionController().getTotalVoters();


                DateTime date = DateTime.now();
                var now = Jiffy.parse(date.toString()).format(pattern: 'MMMM do yyyy, h:mm a');
                await SessionController().saveLastSync(now);
                await SessionController().getLastSync();

                notificationNotifier.value = now.toString();
                isDataSync.value= false;
              }
            }).onError((error,stackTrace){
              debugPrint("error $error");
              emit(state.copyWith(postApiStatus: PostApiStatus.error, message: error.toString()));
            }).whenComplete(() async{
              if(totalLoopCount != 0){
                count = count + 1;
                for(count; count<=totalLoopCount; count++){
                  debugPrint("complete ......$count");
                  Map<String,dynamic> data = {
                    "limit":limit.toString(),
                    "page":count.toString(),
                  };
                  await  getAllData(data,headers,emit).then((value)async{
                    if(value.success == false  && value.message.isNotEmpty){
                      flag=true;
                      emit(state.copyWith(postApiStatus: PostApiStatus.error, message: value.message));
                    }else{
                      debugPrint("insert data ");
                      await databaseHelper.saveApiData(value);
                      await SessionController().saveTotalCount(count+1);
                      await SessionController().getTotalCount();
                    }
                  }).onError((error,stackTrace){
                    flag=true;
                    debugPrint("error $error");
                    emit(state.copyWith(postApiStatus: PostApiStatus.error, message: error.toString()));
                  });
                  if(flag==true){
                    break;
                  }
                }
                debugPrint("end api call");
              }
            });
          debugPrint("end api call##");
          emit(state.copyWith(postApiStatus: PostApiStatus.success));
      }
    });
  }
}