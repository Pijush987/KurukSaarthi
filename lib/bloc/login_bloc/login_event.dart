part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable{
  const LoginEvent();

  @override
  List<Object> get props => [];

}

class PinChange extends LoginEvent{
  final String loginPin;

 const PinChange({required this.loginPin});

  @override
  List<Object> get props => [loginPin];
}

class StatusChange extends LoginEvent{
  final PostApiStatus postApiStatus;

  const StatusChange({required this.postApiStatus});

  @override
  List<Object> get props => [postApiStatus];
}

class Login extends LoginEvent{}