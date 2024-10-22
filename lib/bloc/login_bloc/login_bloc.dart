import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:kuruk_saarthi/repository/login_api/login_api_repository.dart';
import 'package:kuruk_saarthi/services/session_manager/session_controller.dart';
import 'package:kuruk_saarthi/utils/enums.dart';

import '../../utils/const.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginApiRepository loginApiRepository;

  LoginBloc({required this.loginApiRepository}) : super(const LoginState()) {
   on<PinChange>(_onPinChange);
   on<Login>(_onLogin);
   on<StatusChange>(_statusChange);
  }

  void _onPinChange(PinChange event, Emitter<LoginState> emit){
    emit(
        state.copyWith(
            loginPin:event.loginPin
        ),
    );
  }

  void _statusChange(StatusChange event, Emitter<LoginState> emit){
    emit(
      state.copyWith(
          postApiStatus:event.postApiStatus
      ),
    );
  }


  void _onLogin(LoginEvent event, Emitter<LoginState> emit) async{

    Map<String,dynamic> data = {
      "role":"USER",
      "pin":state.loginPin.toString(),
      "key":Constant.privetKey
    };
    emit(state.copyWith(postApiStatus: PostApiStatus.loading));

    await loginApiRepository.loginApi(data: data).then((value)async{
      if(value.success == false){
        emit(state.copyWith(postApiStatus: PostApiStatus.error, message: 'Login Failed'));
      }else{
        await SessionController().saveUserInPreference(value);
        await SessionController().getUserFromPreference();
        emit(state.copyWith(postApiStatus: PostApiStatus.success));
      }
    }).onError((error,stackTrace){
      emit(state.copyWith(postApiStatus: PostApiStatus.error, message: error.toString()));
    });
  }

}
