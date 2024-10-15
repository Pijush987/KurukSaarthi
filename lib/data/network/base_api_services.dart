abstract class BaseApiServices {
  Future<dynamic> getApi({required String url,String token,Map<String,String> headers});
  Future<dynamic> getApiParams({required String url,dynamic queryParams, dynamic header});
  Future<dynamic> postApi({required String url, required Map<String, dynamic> data, dynamic header});
  Future<dynamic> postEncodeApi({required String url, required Map<String, dynamic> data, dynamic header});
  Future<dynamic> putApi({required String url, dynamic data, dynamic header});
  Future<dynamic> deleteApi({required String url});
}