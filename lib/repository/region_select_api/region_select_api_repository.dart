import 'package:kuruk_saarthi/model/region_select_model/region_select_model.dart';

abstract class RegionSelectApiRepository {
  Future<RegionSelectModel> regionSelectApi ({dynamic data, dynamic header});
}