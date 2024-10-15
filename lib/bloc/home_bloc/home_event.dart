part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable{
  const HomeEvent();

  @override
  List<Object> get props => [];

}

class LanguagePopupWindowChange extends HomeEvent{
  final bool openLanguagePopup;
  const LanguagePopupWindowChange({required this.openLanguagePopup});

  @override
  List<Object> get props => [openLanguagePopup];
}

class HomeStatusChange extends HomeEvent{
  final PostApiStatus postApiStatus;
  const HomeStatusChange({required this.postApiStatus});

  @override
  List<Object> get props => [postApiStatus];
}

class FetchVoterList extends HomeEvent{}

