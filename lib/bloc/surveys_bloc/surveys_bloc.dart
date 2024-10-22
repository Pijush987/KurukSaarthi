import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/model/survey_list_model/survey_list_model.dart';
import 'package:kuruk_saarthi/model/survey_static_model/survey_static_model.dart';
import 'package:kuruk_saarthi/services/session_manager/session_controller.dart';
import 'package:kuruk_saarthi/utils/const.dart';
import 'package:kuruk_saarthi/utils/enums.dart';

import '../../model/manage_survey_model/manage_survey_model.dart';
import '../../repository/survey_api/survey_api_repository.dart';

part 'surveys_event.dart';
part 'surveys_state.dart';

class SurveysBloc extends Bloc<SurveysEvent, SurveysState> {
  SurveyApiRepository surveyApiRepository;
  List<SurveyModel> _allSurvey = [];
  Map<String,dynamic>selectedSurveys = {};
  List surveyList = [];
  int _currentpage = 1;

  SurveysBloc({required this.surveyApiRepository}) : super(SurveysState(
     staticSurvey: {},
      boothNumberItemsList: [],
      allRegion: [],
      allArea: [],
      allSurvey: [],
      selectedSurveyDropdownList: [],
      selectedSurveys: [])) {

    on<RegionChange>(_onRegionChange);
    on<SurveyStatic>(_onSurveyStatic);
    on<RegionListChange>(_onRegionListChange);
    on<RegionDropdownExpanded>(_onRegionDropdownExpanded);

    on<AreaChange>(_onAreaChange);
    on<AreaListChange>(_onAreaListChange);
    on<AreaDropdownExpanded>(_onAreaDropdownExpanded);


    on<BoothInchargeNameChange>(_onBoothInchargeNameChange);


    on<BoothNumberChange>(_onBoothChange);
    on<BoothNumberListChange>(_onBoothListChange);
    on<BoothDropdownExpanded>(_onBoothDropdownExpanded);

    on<VoterChange>(_onVoterChange);
    on<VoterIconVisible>(_onVoterIconVisible);

    on<CreateBoothIncharge>(_onCreateBoothincharge);
    // on<EditBoothIncharge>(_onEditBoothincharge);
    on<FetchSurveyList>(_onFetchSurveyList);
    on<StatusChange>(_statusChange);

    on<SurveyManage>(_onSurveyManage);

  }

  void _onRegionDropdownExpanded(RegionDropdownExpanded event, Emitter<SurveysState> emit){
    emit(state.copyWith(isRegionDropdownExpanded:event.isRegionDropdownExpanded));
  }
  void _onRegionChange(RegionChange event, Emitter<SurveysState> emit){
    emit(state.copyWith(selectedRegion:event.selectedRegion));
    emit(state.copyWith(selectedBoothNumber:''));
    emit(state.copyWith(boothNumberItemsList:[]));
  }
  void _onRegionListChange(RegionListChange event, Emitter<SurveysState> emit){
    emit(state.copyWith(allRegion:event.allRegionList));
    emit(state.copyWith(selectedBoothNumber:''));
    emit(state.copyWith(boothNumberItemsList:[]));
  }


  void _onAreaChange(AreaChange event, Emitter<SurveysState> emit){
    emit(state.copyWith(selectedArea: event.selectedArea));
    emit(state.copyWith(selectedRegion:''));
    emit(state.copyWith(allRegion:[]));
    emit(state.copyWith(selectedBoothNumber:''));
    emit(state.copyWith(boothNumberItemsList:[]));
  }
  void _onAreaDropdownExpanded(AreaDropdownExpanded event, Emitter<SurveysState> emit){
    emit(state.copyWith(isAreaDropdownExpanded:event.isAreaDropdownExpanded),);
  }
  void _onAreaListChange(AreaListChange event, Emitter<SurveysState> emit){
    emit(state.copyWith(allArea:event.allAreaList),);
    emit(state.copyWith(selectedRegion:''));
    emit(state.copyWith(allRegion:[]));
    emit(state.copyWith(selectedBoothNumber:''));
    emit(state.copyWith(boothNumberItemsList:[]));
  }


  void _onBoothDropdownExpanded(BoothDropdownExpanded event, Emitter<SurveysState> emit){
    emit(state.copyWith(isBoothNumberDropdownExpanded:event.isBoothDropdownExpanded));
  }
  void _onBoothChange(BoothNumberChange event, Emitter<SurveysState> emit){
    emit(state.copyWith(selectedBoothNumber:event.boothNumberChange));
  }
  void _onBoothListChange(BoothNumberListChange event, Emitter<SurveysState> emit){
    emit(state.copyWith(boothNumberItemsList:event.allBoothNumberList));
  }


  // void _onVoterDropdownExpanded(VoterDropdownExpanded event, Emitter<SurveysState> emit){
  //        isVoterDropdownExpanded[event.index] = !isVoterDropdownExpanded[event.index];
  //       emit(state.copyWith(isVoterDropdownExpanded:isVoterDropdownExpanded),
  //   );
  // }


  void _onVoterChange(VoterChange event, Emitter<SurveysState> emit)async{
    if(event.isUpdate){
      Survey se = Survey(pollStatus: event.voterNumberChange,voterIDNumber:event.voterIDNumber,isUpdate: true);
      Map<String,dynamic> sur = se.toJson();
      surveyList.add(sur);
      emit(state.copyWith(selectedSurveyDropdownList:surveyList));
    }else{
      Survey se = Survey(pollStatus: event.voterNumberChange,voterIDNumber:event.voterIDNumber);
      Map<String,dynamic> sur = se.toJson();
      surveyList.add(sur);
      emit(state.copyWith(selectedSurveyDropdownList:surveyList));
    }
    Constant.countListinear.value = state.selectedSurveyDropdownList.length;
    print("object  ${state.selectedSurveyDropdownList.length}");
    emit(state.copyWith(count:state.selectedSurveyDropdownList.length));
    if(state.selectedSurveyDropdownList.length == 2){
      // SurveysBloc.read<SurveysBloc>().add(SurveyManage());
    }
  }

  void _onVoterIconVisible(VoterIconVisible event, Emitter<SurveysState> emit){
    emit(
      state.copyWith(
          isVoterIconVisible:event.isVoterIconVisible
      ),
    );
  }

  void _onBoothInchargeNameChange(BoothInchargeNameChange event, Emitter<SurveysState> emit){
    emit(
      state.copyWith(
          boothInchargeName:event.boothInchargeName
      ),
    );
  }

  void _onCreateBoothincharge(CreateBoothIncharge event, Emitter<SurveysState> emit) async{
    final onValue = await SessionController().sharedPreferenceClass.readValue('token');
    Map<String, dynamic> token = jsonDecode(onValue) ;
       Map <String, String> headers = {
         'Authorization': 'Bearer ${token['token']}'
       };

    Map<String, dynamic> data=  {
      "region":state.selectedRegion.toString(),
      "subDivision": state.selectedArea.toString(),
      "boothNumber": state.selectedBoothNumber.toString(),
      "inChargeName":state.boothInchargeName.toString(),
  };

    emit(state.copyWith(postApiStatus: PostApiStatus.loading));

    try {
      await surveyApiRepository.createBoothInchargeApi(body: data,header: headers).then((value)async{
        debugPrint("success $value");
        if(value['success'] == false && value['code'] == null){
          emit(state.copyWith(postApiStatus: PostApiStatus.error, message: 'booth incharge save failed'));
        }
        else if (value['success'] == false && value['code'] == 'INCHARGE_EXISTS'){
          await SessionController().saveBoothNo(value['boothNumber'].toString());
          await SessionController().getBoothNo();
          await SessionController().saveBoothInchargeId(value['_id'].toString());
          await SessionController().getBoothInchargeId();
          emit(state.copyWith(postApiStatus: PostApiStatus.success,message: 'Incharge already exist'));
        }
        else{
          await SessionController().saveBoothNo(value['doc']['boothNumber'].toString());
          await SessionController().getBoothNo();
          await SessionController().saveBoothInchargeId(value['doc']['_id'].toString());
          await SessionController().getBoothInchargeId();
          emit(state.copyWith(postApiStatus: PostApiStatus.success));
        }
      }).onError((error,stackTrace){
        emit(state.copyWith(postApiStatus: PostApiStatus.error, message: error.toString()));
      });
    } catch (e) {
      emit(state.copyWith(postApiStatus: PostApiStatus.error, message: "data fetch error"));
    }
  }

  // void _onEditBoothincharge(EditBoothIncharge event, Emitter<SurveysState> emit) async{
  //   final onValue = await SessionController().sharedPreferenceClass.readValue('token');
  //   Map<String, dynamic> token = jsonDecode(onValue) ;
  //   Map <String, String> headers = {
  //     'Authorization': 'Bearer ${token['token']}'
  //   };
  //
  //   Map<String, dynamic> data=  {
  //     "key":Constant.privetKey.toString(),
  //     "inchargeId": await SessionController().sharedPreferenceClass.readValue('boothInchargeId').toString(),
  //     "inChargeName":state.boothInchargeName.toString(),
  //   };
  //
  //   emit(state.copyWith(postApiStatus: PostApiStatus.loading));
  //
  //   try {
  //     await surveyApiRepository.editBoothInchargeApi(body: data,header: headers).then((value)async{
  //       debugPrint("success $value");
  //       if(value['success'] == false && value['code'] == null){
  //         emit(state.copyWith(postApiStatus: PostApiStatus.error, message: 'booth incharge save failed'));
  //       }
  //       else if (value['success'] == false && value['code'] != null){
  //         emit(state.copyWith(postApiStatus: PostApiStatus.error, message: 'booth incharge save failed'));
  //       }
  //       else{
  //         emit(state.copyWith(postApiStatus: PostApiStatus.success));
  //       }
  //     }).onError((error,stackTrace){
  //       debugPrint("step4  $error");
  //       emit(state.copyWith(postApiStatus: PostApiStatus.error, message: error.toString()));
  //     });
  //   } catch (e) {
  //     emit(state.copyWith(postApiStatus: PostApiStatus.error, message: "data fetch error"));
  //   }
  // }

  void _onFetchSurveyList(FetchSurveyList event, Emitter<SurveysState> emit) async{
    if(event.refresh){
      _currentpage = 1;
      _allSurvey.clear();
    }

    final token = await SessionController().sharedPreferenceClass.readValue('token');
    final String boothNo =await SessionController().sharedPreferenceClass.readValue('boothNo');
    debugPrint("boothNo $boothNo");

    Map<String, dynamic> newToken = jsonDecode(token) ;

    Map <String, String> headers = {
      'Authorization': 'Bearer ${newToken['token']}'
    };


    Map<String,dynamic> data = {
      "limit":"15",
      "page": _currentpage.toString(),
      "boothNumber": boothNo.toString(),
    };


    emit(state.copyWith(isLoading: true));
    if(_currentpage == 1){
      emit(state.copyWith(postApiStatus: PostApiStatus.loading));
    }


    try {
      await surveyApiRepository.fetchSurveyList(header:headers,queryParams:data ).then((value)async{
        log("success $value");
        if(value.success == false){
          emit(state.copyWith(postApiStatus: PostApiStatus.error, message: value.message));
        }
        else{
          log("success ${value.limit}");
          _allSurvey.addAll(value.docs);
          log("success ${value.docs.length}");
          emit(state.copyWith(allSurvey: List.from(_allSurvey)));

          emit(state.copyWith(postApiStatus: PostApiStatus.success));
          emit(state.copyWith(isLoading: false));

          _currentpage++;
        }
      }).onError((error,stackTrace){
        debugPrint("step4  $error");
        emit(state.copyWith(postApiStatus: PostApiStatus.error, message: error.toString()));
      });
    } catch (e) {
      emit(state.copyWith(postApiStatus: PostApiStatus.error, message: "data fetch error"));
    }
  }

  void _onSurveyManage(SurveyManage event, Emitter<SurveysState> emit)async{
    if(state.count ==0){
      return;
    }
    log(selectedSurveys.toString());
    Constant.loading.value = "ShowLoading";
    final token = await SessionController().sharedPreferenceClass.readValue('token');
    Map<String, dynamic> newToken = jsonDecode(token) ;

    Map<String,String> headers = {
      'Content-Type':'application/json',
      'Authorization': 'Bearer ${newToken['token']}'
    };
    final String boothInchargeId =await SessionController().sharedPreferenceClass.readValue('boothInchargeId');

    selectedSurveys['inchargeId']=boothInchargeId.toString();
    selectedSurveys['polls']=surveyList;

    print("selectedSurveys   $selectedSurveys");
    ManageSurveyModel manageSurveyModel = ManageSurveyModel.fromJson(selectedSurveys);
    emit(state.copyWith(postApiStatus: PostApiStatus.loading));
    try {
      await  surveyApiRepository.surveyManageApi(header:headers,body:manageSurveyModel.toJson()).then((value)async{
        log("success $value");
        if(value["success"] == false){
          emit(state.copyWith(postApiStatus: PostApiStatus.error, message: value.message));
        }
        else{
          log("success %%%%%%%%%%${value}");
          selectedSurveys = {};
          surveyList.clear();
          emit(state.copyWith(selectedSurveyDropdownList:[]));
          emit(state.copyWith(count: 0));
          Constant.countListinear.value = 0;
          log("success ** ");
          Constant.loading.value = "StopLoading";
          emit(state.copyWith(postApiStatus: PostApiStatus.success,message: "successfully updated voter list"));
        }
      }).onError((error,stackTrace){
        selectedSurveys = {};
        surveyList.clear();
        emit(state.copyWith(selectedSurveyDropdownList:[]));
        emit(state.copyWith(count: 0));
        Constant.countListinear.value = 0;
        debugPrint("step4  $error");
        emit(state.copyWith(postApiStatus: PostApiStatus.error, message: error.toString()));
        Constant.loading.value = "StopLoading";
      });
    } catch (e) {
      selectedSurveys = {};
      surveyList.clear();
      emit(state.copyWith(selectedSurveyDropdownList:[]));
      emit(state.copyWith(count: 0));
      Constant.countListinear.value = 0;
      emit(state.copyWith(postApiStatus: PostApiStatus.error, message: "data fetch error"));
      Constant.loading.value = "StopLoading";
    }
  }

  void _onSurveyStatic(SurveyStatic event, Emitter<SurveysState> emit)async{
    final token = await SessionController().sharedPreferenceClass.readValue('token');
    Map<String, dynamic> newToken = jsonDecode(token) ;

    Map<String,String> headers = {
      'Content-Type':'application/json',
      'Authorization': 'Bearer ${newToken['token']}'
    };

    Map<String,dynamic> data = {

    };

    emit(state.copyWith(postApiStatusStatic: PostApiStatus.loading));

    try {
      await  surveyApiRepository.getSurveyStatistics(header:headers,queryParams:data).then((value)async{
        if(value["success"] == false && value["code"]==420){
          await SessionController().removeUserInPreference();
          await SessionController().getUserFromPreference();
          print("Authentication failed. Try logging in again");
          emit(state.copyWith(postApiStatusStatic: PostApiStatus.error, message: "420"));
        }
        else if(value["success"] == false){
          emit(state.copyWith(postApiStatusStatic: PostApiStatus.error, message: value.message));
        }
        else{
          print("fffffff@@@@@@@@ $value");
          await SessionController().saveSurvey(double.parse(value["doc"]["total"].toString()));
          await SessionController().getSurvey();

          await SessionController().savePartyPositive(double.parse(value["doc"]["PARTY_PLUS"].toString()));
          await SessionController().getPartyPositive();

          await SessionController().savePartyNagetive(double.parse(value["doc"]["PARTY_MINUS"].toString()));
          await SessionController().getPartyNagetive();

          await SessionController().saveDead(double.parse(value["doc"]["DEAD"].toString()));
          await SessionController().getDead();

          await SessionController().saveNeutral(double.parse(value["doc"]["NEUTRAL"].toString()));
          await SessionController().getNeutral();
          // emit(state.copyWith(staticSurvey: jsonDecode(value)));
          emit(state.copyWith(postApiStatusStatic: PostApiStatus.success));
        }
      }).onError((error,stackTrace){
        emit(state.copyWith(postApiStatusStatic: PostApiStatus.error, message: error.toString()));
      });
    } catch (e) {
      emit(state.copyWith(postApiStatusStatic: PostApiStatus.error, message: "data fetch error"));
    }
  }


  void _statusChange(StatusChange event, Emitter<SurveysState> emit){
    emit(
      state.copyWith(
          postApiStatus:event.postApiStatus
      ),
    );
  }
}
