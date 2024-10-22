import 'package:kuruk_saarthi/data/network/base_api_services.dart';
import 'package:kuruk_saarthi/data/network/network_api_services.dart';
import 'package:kuruk_saarthi/model/survey_list_model/survey_list_model.dart';
import 'package:kuruk_saarthi/repository/survey_api/survey_repository.dart';
import 'package:kuruk_saarthi/utils/app_urls.dart';

import '../../model/survey_static_model/survey_static_model.dart';

class SurveyHttpApiRepository extends SurveyApiRepository{
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future createBoothInchargeApi({body, header})async {
    final result = await _apiServices.postApi(url: AppUrl.saveSurveyIncharge, data: body, header: header);
    return result;
  }

  @override
  Future editBoothInchargeApi({body, header}) async{
    final result = await _apiServices.postApi(url: AppUrl.editSurveyIncharge, data: body, header: header);
    return result;
  }

  @override
  Future<SurveyListModel> fetchSurveyList({queryParams, header}) async{
    final result = await _apiServices.getApiParams(url: AppUrl.surveyList, queryParams: queryParams, header: header);
    return SurveyListModel.fromJson(result);
  }

  @override
  Future surveyManageApi({required Map<String, dynamic> body, required Map<String, String> header}) async{
    final result = await _apiServices.postEncodeApi(url: AppUrl.surveyManage, data: body, header: header);
    return result;
  }

  @override
  Future<dynamic> getSurveyStatistics({queryParams, header}) async{
    final result = await _apiServices.getApiParams(url: AppUrl.staticSurvey, queryParams: queryParams, header: header);
    return result;
  }

}