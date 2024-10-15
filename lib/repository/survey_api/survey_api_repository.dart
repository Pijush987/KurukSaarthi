
import 'package:kuruk_saarthi/model/survey_list_model/survey_list_model.dart';
import 'package:kuruk_saarthi/model/survey_static_model/survey_static_model.dart';

abstract class SurveyApiRepository {
  Future<dynamic> createBoothInchargeApi ({dynamic body, dynamic header});
  Future<dynamic> editBoothInchargeApi ({dynamic body, dynamic header});
  Future<dynamic> surveyManageApi ({required Map<String, dynamic> body, required Map<String,String> header});
  Future<SurveyListModel> fetchSurveyList ({dynamic queryParams, dynamic header});
  Future<dynamic> getSurveyStatistics ({dynamic queryParams, dynamic header});
}