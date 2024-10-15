part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable{
  const DashboardEvent();

  @override
  List<Object> get props => [];

}

class CurrentIndexChange extends DashboardEvent{
  final int currentIndex;

 const CurrentIndexChange({required this.currentIndex});

  @override
  List<Object> get props => [currentIndex];
}
