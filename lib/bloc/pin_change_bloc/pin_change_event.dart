part of 'pin_change_bloc.dart';

abstract class PinChangeEvent extends Equatable {
  const PinChangeEvent();

  @override
  List<Object> get props => [];
}

class PinChangeFor extends PinChangeEvent{
  final String pinChangeFor;

  const PinChangeFor({required this.pinChangeFor});

  @override
  List<Object> get props => [pinChangeFor];
}


class ChangeNewPin extends PinChangeEvent{
  final String newPin;

  const ChangeNewPin({required this.newPin});

  @override
  List<Object> get props => [newPin];
}


class ChangeConfirmPin extends PinChangeEvent{
  final String reNewPin;

  const ChangeConfirmPin({required this.reNewPin});

  @override
  List<Object> get props => [reNewPin];
}


class ChangeConfirmPinVisible extends PinChangeEvent{
  final bool reNewPinVisible;

  const ChangeConfirmPinVisible({required this.reNewPinVisible});

  @override
  List<Object> get props => [reNewPinVisible];
}


class ChangeNewPinVisible extends PinChangeEvent{
  final bool newPinVisible;

  const ChangeNewPinVisible({required this.newPinVisible});

  @override
  List<Object> get props => [newPinVisible];
}



class PinChangeApi extends PinChangeEvent{}