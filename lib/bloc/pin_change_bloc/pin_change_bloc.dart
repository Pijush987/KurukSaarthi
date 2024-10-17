
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/repository/region_select_api/region_select_api_repository.dart';
import 'package:kuruk_saarthi/services/session_manager/session_controller.dart';
import 'package:kuruk_saarthi/utils/const.dart';
import 'package:kuruk_saarthi/utils/enums.dart';

import '../../repository/login_api/login_api_repository.dart';

part 'pin_change_event.dart';
part 'pin_change_state.dart';

class PinChangeBloc extends Bloc<PinChangeEvent, PinChangeState> {
  LoginApiRepository loginApiRepository;

  PinChangeBloc({required this.loginApiRepository}) : super(PinChangeState()) {
    on<PinChangeFor>(_pinChange);
    on<ChangeNewPin>(_newPinChange);
    on<ChangeConfirmPin>(_newConfirmPinChange);
    on<ChangeNewPinVisible>(_newPinChangeVisible);
    on<ChangeConfirmPinVisible>(_newConfirmPinChangeVisible);
    on<PinChangeApi>(_pinChangeApi);
    on<StatusChange>(_statusChange);

  }

  void _pinChange(PinChangeFor event, Emitter<PinChangeState> emit){
    emit(
      state.copyWith(
          pinChangeFor:event.pinChangeFor
      ),
    );
  }
  void _newPinChange(ChangeNewPin event, Emitter<PinChangeState> emit){
    emit(
      state.copyWith(
          newPin:event.newPin
      ),
    );
  }
  void _newConfirmPinChange(ChangeConfirmPin event, Emitter<PinChangeState> emit){
    emit(
      state.copyWith(
          reNewPin:event.reNewPin
      ),
    );
  }
  void _newConfirmPinChangeVisible(ChangeConfirmPinVisible event, Emitter<PinChangeState> emit){
    emit(
      state.copyWith(
          isReNewPinVisible:event.reNewPinVisible
      ),
    );
  }
  void _newPinChangeVisible(ChangeNewPinVisible event, Emitter<PinChangeState> emit){
    emit(
      state.copyWith(
          isNewPinVisible:event.newPinVisible
      ),
    );
  }

  void _statusChange(StatusChange event, Emitter<PinChangeState> emit){
    emit(
      state.copyWith(
          postApiStatus:event.postApiStatus
      ),
    );
  }

  void _pinChangeApi(PinChangeApi event, Emitter<PinChangeState> emit) async{

    final token = await SessionController().sharedPreferenceClass.readValue('token');
    Map<String, dynamic> newToken = jsonDecode(token) ;
    emit(state.copyWith(postApiStatus: PostApiStatus.loading));

    Map<String,String> headers = {
      'Authorization': 'Bearer ${newToken['token']}'
    };


    Map<String,dynamic> data = {
      "role":state.pinChangeFor.toString()=="Karyakarta"?"USER":"MEMBER",
      "pin":state.newPin.toString(),
    };
    debugPrint("step1");


    await loginApiRepository.pinChange(data: data,header: headers).then((value)async{
      debugPrint("step2");
      if(value['success'] == false  && value["message"].isNotEmpty){
        emit(state.copyWith(postApiStatus: PostApiStatus.error, message: value["message"]));
      }else{
        debugPrint("step3");
        emit(state.copyWith(postApiStatus: PostApiStatus.success));
      }
    }).onError((error,stackTrace){
      debugPrint("step4");
      emit(state.copyWith(postApiStatus: PostApiStatus.error, message: error.toString()));
    });
  }
}
