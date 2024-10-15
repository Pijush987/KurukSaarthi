part of 'login_bloc.dart';

 class LoginState extends Equatable {
  final String loginPin;
  final String message;
  final PostApiStatus postApiStatus;
  const LoginState({ this.loginPin = '', this.message = '', this.postApiStatus = PostApiStatus.initial});

  LoginState copyWith ({
      String? loginPin,
      String? message,
      PostApiStatus? postApiStatus
}){
    return LoginState(
        loginPin: loginPin ?? this.loginPin,
        message: message ?? this.message,
      postApiStatus: postApiStatus ?? this.postApiStatus
    );
}

  @override
  List<Object> get props => [loginPin,message,postApiStatus];
}


