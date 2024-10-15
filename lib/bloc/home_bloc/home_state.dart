part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool openLanguagePopup;
  final String message;
  final PostApiStatus postApiStatus;

  const HomeState({this.openLanguagePopup = false,this.message = '', this.postApiStatus = PostApiStatus.initial});

  HomeState copyWith ({
    bool? openLanguagePopup,
    String? message,
    PostApiStatus? postApiStatus,
  }){
    return HomeState(
      openLanguagePopup: openLanguagePopup ?? this.openLanguagePopup,
      message: message ?? this.message,
      postApiStatus: postApiStatus ?? this.postApiStatus,
    );
  }

  @override
  List<Object> get props => [openLanguagePopup,postApiStatus,message];
}