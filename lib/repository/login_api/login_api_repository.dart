import 'package:kuruk_saarthi/model/login_model/login_model.dart';

abstract class LoginApiRepository {
  Future<LoginModel> loginApi ({Map<String,dynamic> data, Map<String,String> header});
  Future<dynamic> pinChange ({Map<String,dynamic> data, Map<String,String> header});

}