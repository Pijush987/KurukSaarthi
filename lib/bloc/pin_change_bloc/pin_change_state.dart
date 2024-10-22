part of 'pin_change_bloc.dart';

class PinChangeState extends Equatable {
  final String pinChangeFor;
  final String newPin;
  final String reNewPin;
  final bool isNewPinVisible;
  final bool isReNewPinVisible;
   PinChangeState({this.pinChangeFor = '',this.newPin = '', this.reNewPin = '',this.isNewPinVisible = true,this.isReNewPinVisible = true});

  PinChangeState copyWith ({
    String? pinChangeFor,
    String? newPin,
    String? reNewPin,
    bool? isNewPinVisible,
    bool? isReNewPinVisible
  }){
    return PinChangeState(
      pinChangeFor: pinChangeFor ?? this.pinChangeFor,
      newPin: newPin ?? this.newPin,
      reNewPin: reNewPin ?? this.reNewPin,
      isNewPinVisible: isNewPinVisible ?? this.isNewPinVisible,
      isReNewPinVisible: isReNewPinVisible ?? this.isReNewPinVisible,
    );
  }

  @override
  List<Object> get props => [pinChangeFor,newPin,reNewPin,isNewPinVisible,isReNewPinVisible];
}
