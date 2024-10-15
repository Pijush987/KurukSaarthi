part of 'pin_change_bloc.dart';

class PinChangeState extends Equatable {
  final String pinChangeFor;
  final String newPin;
  final String reNewPin;
  final bool isNewPinVisible;
  final bool isReNewPinVisible;
  final String message;
  final PostApiStatus postApiStatus;
  PinChangeState({this.postApiStatus = PostApiStatus.initial,this.pinChangeFor = '',this.newPin = '', this.reNewPin = '',this.isNewPinVisible = true,this.isReNewPinVisible = true,this.message = ''});

  PinChangeState copyWith ({
    String? pinChangeFor,
    String? newPin,
    String? reNewPin,
    String? message,
    bool? isNewPinVisible,
    bool? isReNewPinVisible,
    PostApiStatus? postApiStatus
  }){
    return PinChangeState(
        pinChangeFor: pinChangeFor ?? this.pinChangeFor,
        newPin: newPin ?? this.newPin,
        reNewPin: reNewPin ?? this.reNewPin,
        isNewPinVisible: isNewPinVisible ?? this.isNewPinVisible,
        isReNewPinVisible: isReNewPinVisible ?? this.isReNewPinVisible,
        postApiStatus: postApiStatus ?? this.postApiStatus,
         message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [pinChangeFor,newPin,reNewPin,isNewPinVisible,isReNewPinVisible,postApiStatus,message];
}
