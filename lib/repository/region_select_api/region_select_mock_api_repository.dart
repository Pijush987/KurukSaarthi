import 'package:kuruk_saarthi/model/region_select_model/region_select_model.dart';
import 'region_select_api_repository.dart';

class RegionSelectMockApiRepository extends RegionSelectApiRepository {
  @override
  Future<RegionSelectModel> regionSelectApi({data, header}) async{
    await Future.delayed(const Duration(seconds: 2));
    var responseData = {'message': 'Profile created'};
    return RegionSelectModel.fromJson(responseData);
  }

}