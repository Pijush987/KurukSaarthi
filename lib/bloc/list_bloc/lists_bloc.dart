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
  }

  Future<void> _onFetchLists( FetchLists event, Emitter<ListsState> emit) async {

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
    else if(event.voterIdFilter.isNotEmpty || event.age.isNotEmpty){
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
          debugPrint("fetch data");
          final value = await databaseHelper.getVoters( offset:_currentpage*event.limit ,limit: event.limit);
          _currentpage++;
          _allVoters.addAll(value);
          emit(state.copyWith(allVoters: List.from(_allVoters)));
          emit(state.copyWith(postApiStatus: PostApiStatus.success));
        } catch (e) {
          emit(state.copyWith(postApiStatus: PostApiStatus.error, message: "data fetch error"));
        }
      }
    }
  }
}