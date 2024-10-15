
import 'package:kuruk_saarthi/data/network/base_api_services.dart';
import 'package:kuruk_saarthi/repository/notification_api/notification_api_repository.dart';
import 'package:kuruk_saarthi/utils/app_urls.dart';

import '../../data/network/network_api_services.dart';

class NotificationHttpApiRepository extends NotificationApiRepository{
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future notificationApi({Map<String, dynamic>? data, Map<String, String>? header}) async{
    final result = await _apiServices.postApi(url: AppUrl.notification, data: data!, header: header);
    return result;
  }
}