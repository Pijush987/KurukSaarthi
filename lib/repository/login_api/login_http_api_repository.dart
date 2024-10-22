import 'package:kuruk_saarthi/data/network/base_api_services.dart';
import 'package:kuruk_saarthi/data/network/network.dart';
import 'package:kuruk_saarthi/model/login_model/login_model.dart';
import 'package:kuruk_saarthi/repository/login_api/login_api_repository.dart';
import 'package:kuruk_saarthi/utils/app_urls.dart';

class LoginHttpApiRepository extends LoginApiRepository{
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future<LoginModel> loginApi({Map<String, dynamic>? data, Map<String, String>? header}) async{
    final result = await _apiServices.postApi(url: AppUrl.loginApi, data: data!, header: header);
    return LoginModel.fromJson(result);
  }

}