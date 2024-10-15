import 'dart:developer';

import 'package:kuruk_saarthi/data/network/base_api_services.dart';
import 'package:kuruk_saarthi/data/network/network_api_services.dart';
import 'package:kuruk_saarthi/model/survey_static_model/survey_static_model.dart';
import 'package:kuruk_saarthi/model/voter_list_model/dart/voter_list_model.dart';
import 'package:kuruk_saarthi/repository/voter_list_api/voter_api_repository.dart';

import '../../utils/app_urls.dart';

class VoterHttpApiRepository extends VoterListApiRepository{
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future<VoterListModel> voterListApi({queryParams, header})async {
    final result = await _apiServices.getApiParams(url: AppUrl.voterListAPi, queryParams: queryParams, header: header);
    return VoterListModel.fromJson(result);
  }
}