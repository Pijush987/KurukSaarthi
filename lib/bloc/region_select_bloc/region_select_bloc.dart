
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kuruk_saarthi/repository/region_select_api/region_select_api_repository.dart';
import 'package:kuruk_saarthi/services/session_manager/session_controller.dart';
import 'package:kuruk_saarthi/utils/enums.dart';

part 'region_select_event.dart';
part 'region_select_state.dart';

class RegionSelectBloc extends Bloc<RegionSelectEvent, RegionSelectState> {
  RegionSelectApiRepository regionSelectApiRepository;

  RegionSelectBloc({required this.regionSelectApiRepository}) : super(RegionSelectState(selectedItemsList: [])) {
    on<RegionChange>(_onRegionChange);
    on<RegionSelectApi>(_onRegionSelectApi);
    on<DropdownExpanded>(_onDropdownExpanded);
    on<IconVisible>(_onIconVisible);
    on(_onSelectedItems);
  }

  void _onDropdownExpanded(DropdownExpanded event, Emitter<RegionSelectState> emit){
    emit(
      state.copyWith(
          isDropdownExpanded:event.isDropdownExpanded
      ),
    );
  }

  void _onRegionChange(RegionChange event, Emitter<RegionSelectState> emit){
    emit(state.copyWith(selectedRegion:event.selectedRegion));
  }
void _onSelectedItems(RegionSelectEvent event, Emitter<RegionSelectState> emit){
  if (event is AddItemEvent) {
    final currentState = state as RegionSelectState;
    final updatedList = List<String>.from(currentState.selectedItemsList)..add(event.item);
    emit(state.copyWith(selectedItemsList: updatedList));
  } else if (event is RemoveItemEvent) {
    final currentState =  state as RegionSelectState;
    final updatedList = List<String>.from(currentState.selectedItemsList)..remove(event.item);
    emit(state.copyWith(selectedItemsList: updatedList));
  }

  }

  void _onIconVisible(IconVisible event, Emitter<RegionSelectState> emit){
    emit(
      state.copyWith(
          isIconVisible:event.isIconVisible
      ),
    );
  }

  void _onRegionSelectApi(RegionSelectApi event, Emitter<RegionSelectState> emit) async{

    log("token// ${SessionController().sharedPreferenceClass.readValue('token').toString()}");
    Map data = {
      'region' : state.selectedRegion,
      'token': SessionController().sharedPreferenceClass.readValue('token').toString()
    };

    emit(state.copyWith(postApiStatus: PostApiStatus.loading));

    await regionSelectApiRepository.regionSelectApi(data: data).then((value)async{
      if(value.error.isNotEmpty){
        emit(state.copyWith(postApiStatus: PostApiStatus.error, message: value.error));
      }else{
        emit(state.copyWith(postApiStatus: PostApiStatus.success,message: value.message));
      }
    }).onError((error,stackTrace){
      emit(state.copyWith(postApiStatus: PostApiStatus.error, message: error.toString()));
    });
  }

}
