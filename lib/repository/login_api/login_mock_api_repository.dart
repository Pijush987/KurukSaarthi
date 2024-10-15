import 'package:kuruk_saarthi/model/login_model/login_model.dart';
import 'package:kuruk_saarthi/repository/login_api/login_repository.dart';

class LoginMockApiRepository extends LoginApiRepository {
  @override
  Future<LoginModel> loginApi({Map<String,dynamic>? data, Map<String,String>? header}) async{
    await Future.delayed(const Duration(seconds: 2));
    var responseData = {'token': '67456'};
    return LoginModel.fromJson(responseData);
  }

  @override
  Future pinChange({Map<String, dynamic>? data, Map<String, String>? header}) {
    // TODO: implement pinChange
    throw UnimplementedError();
  }

}