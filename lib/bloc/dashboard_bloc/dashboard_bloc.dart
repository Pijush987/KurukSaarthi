import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {

  DashboardBloc() : super(const DashboardState()) {
   on<CurrentIndexChange>(_onCurrentIndexChange);
  }

  void _onCurrentIndexChange(CurrentIndexChange event, Emitter<DashboardState> emit){
    emit(
        state.copyWith(
            currentIndex:event.currentIndex
        ),
    );
  }
}
