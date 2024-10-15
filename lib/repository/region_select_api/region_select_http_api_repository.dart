import 'package:kuruk_saarthi/data/network/base_api_services.dart';
import 'package:kuruk_saarthi/data/network/network.dart';
import 'package:kuruk_saarthi/model/region_select_model/region_select_model.dart';
import 'package:kuruk_saarthi/utils/app_urls.dart';
import 'region_select_api_repository.dart';

class RegionSelectHttpApiRepository extends RegionSelectApiRepository{
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future<RegionSelectModel> regionSelectApi({data, header}) async{
   final result = await _apiServices.postApi(url: AppUrl.regionSelect, data: data, header: header);
     return RegionSelectModel.fromJson(result);
  }
}