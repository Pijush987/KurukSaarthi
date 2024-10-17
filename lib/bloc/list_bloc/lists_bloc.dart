import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuruk_saarthi/bloc/home_bloc/home_bloc.dart';
import 'package:kuruk_saarthi/bloc/list_bloc/lists_state.dart';
import 'package:kuruk_saarthi/model/voter_list_model/dart/voter_list_model.dart';
import 'package:kuruk_saarthi/services/database/database_services.dart';
import 'package:kuruk_saarthi/services/session_manager/session_controller.dart';
import 'package:kuruk_saarthi/utils/enums.dart';
import 'lists_event.dart';

class ListsBloc extends Bloc<ListsEvent, ListsState> {
  final DatabaseHelper databaseHelper = DatabaseHelper();
   List<VoterModel> _allVoters = [];
   int _currentpage = 0;

  ListsBloc() : super(const ListsState(allVoters: [])) {
    on<FetchLists>(_onFetchLists);
    on<RegionChange>(_onRegonChange);
    on<BoothChange>(_onBoothChange);
    on<AgeChange>(_onAgeChange);
  }

  void _onRegonChange(RegionChange event, Emitter<ListsState> emit){
    emit(
      state.copyWith(selectedRegion:event.selectedRegion),
    );
  }
  void _onBoothChange(BoothChange event, Emitter<ListsState> emit){
    emit(
      state.copyWith(selectedBooth:event.selectedBooth),
    );
  }
  void _onAgeChange(AgeChange event, Emitter<ListsState> emit){
    emit(
      state.copyWith(selectedAge:event.selectedAge),
    );
  }



  Future<void> _onFetchLists( FetchLists event, Emitter<ListsState> emit) async {
    // emit(state.copyWith(postApiStatus: PostApiStatus.loading));
    if(event.refresh){
      _currentpage = 0;
      _allVoters.clear();
    }
    if(event.searchQuery.isNotEmpty){
      print("value  ${event.searchQuery}");
      emit(state.copyWith(postApiStatus: PostApiStatus.loading));
      try {
        final value = await databaseHelper.searchVoters(event.searchQuery.toString());
        _allVoters.addAll(value);
        emit(state.copyWith(allVoters: List.from(_allVoters)));
        emit(state.copyWith(postApiStatus: PostApiStatus.success));
        print("_allVoters  ${_allVoters}");
      } catch (e) {
        emit(state.copyWith(postApiStatus: PostApiStatus.error, message: "data fetch error"));
      }
    }
    else if(event.voterIdFilter.isNotEmpty){
      print("value  ${event.searchQuery}");
      emit(state.copyWith(postApiStatus: PostApiStatus.loading));
      try {
        final value = await databaseHelper.searchVoters(event.searchQuery.toString());
        _allVoters.addAll(value);
        emit(state.copyWith(allVoters: List.from(_allVoters)));
        emit(state.copyWith(postApiStatus: PostApiStatus.success));
        print("_allVoters  ${_allVoters}");
      } catch (e) {
        emit(state.copyWith(postApiStatus: PostApiStatus.error, message: "data fetch error"));
      }
    }
    else{
      final total = await SessionController().sharedPreferenceClass.readValue('totalVoters')??"0";
      debugPrint("fetch data $total");
      if(_allVoters.length <  int.parse(total)){


        if(_currentpage == 0){
          emit(state.copyWith(postApiStatus: PostApiStatus.loading));
        }


        try {
          debugPrint("fetch data  ${event.age}");
          print("value 7777 ");
          if(event.age.isNotEmpty){
            debugPrint("fetch data %%%%${event.age}");
            final value = await databaseHelper.getVotersByAge( offset:_currentpage*event.limit ,limit: event.limit,age: int.parse(event.age));
            _currentpage++;
            _allVoters.addAll(value);
            emit(state.copyWith(allVoters: List.from(_allVoters)));
            emit(state.copyWith(postApiStatus: PostApiStatus.success));
          }else if(event.booth.isNotEmpty){
            debugPrint("fetch data  #${event.booth}");
            debugPrint("fetch data  ##${_currentpage*event.limit}");
            debugPrint("fetch data  ##${event.limit}");
            final value = await databaseHelper.getVotersByBooth( offset:_currentpage*event.limit ,limit: event.limit,boothNumber: event.booth);
            _currentpage++;
            if(value.isEmpty){
              _allVoters.clear();
              emit(state.copyWith(allVoters: List.from(_allVoters)));
              emit(state.copyWith(postApiStatus: PostApiStatus.success));
            }else{
              _allVoters.addAll(value);
              emit(state.copyWith(allVoters: List.from(_allVoters)));
              emit(state.copyWith(postApiStatus: PostApiStatus.success));
            }
          }else if(event.region.isNotEmpty){
            debugPrint("fetch data  ##${event.region}");
            debugPrint("fetch data  ##${_currentpage*event.limit}");
            debugPrint("fetch data  ##${event.limit}");
            final value = await databaseHelper.getVotersByRegion( offset:_currentpage*event.limit ,limit: event.limit,region: event.region);
            _currentpage++;
            _allVoters.addAll(value);
            emit(state.copyWith(allVoters: List.from(_allVoters)));
            emit(state.copyWith(postApiStatus: PostApiStatus.success));
          }else{
            debugPrint("fetch data &&&");
            final value = await databaseHelper.getVoters( offset:_currentpage*event.limit ,limit: event.limit);
            _currentpage++;
            _allVoters.addAll(value);
            emit(state.copyWith(allVoters: List.from(_allVoters)));
            emit(state.copyWith(postApiStatus: PostApiStatus.success));
          }
        } catch (e) {
          emit(state.copyWith(postApiStatus: PostApiStatus.error, message: "data fetch error"));
        }
      }
    }
  }
}