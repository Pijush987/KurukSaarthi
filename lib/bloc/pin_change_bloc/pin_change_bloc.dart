
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kuruk_saarthi/repository/region_select_api/region_select_api_repository.dart';
import 'package:kuruk_saarthi/services/session_manager/session_controller.dart';
import 'package:kuruk_saarthi/utils/enums.dart';

part 'pin_change_event.dart';
part 'pin_change_state.dart';

class PinChangeBloc extends Bloc<PinChangeEvent, PinChangeState> {

  PinChangeBloc() : super(PinChangeState()) {
    on<PinChangeFor>(_pinChange);
    on<ChangeNewPin>(_newPinChange);
    on<ChangeConfirmPin>(_newConfirmPinChange);
    on<ChangeNewPinVisible>(_newPinChangeVisible);
    on<ChangeConfirmPinVisible>(_newConfirmPinChangeVisible);
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
}
