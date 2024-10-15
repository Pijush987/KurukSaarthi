import 'package:freezed_annotation/freezed_annotation.dart';
part 'region_select_model.freezed.dart';
part 'region_select_model.g.dart';

@freezed

class RegionSelectModel with _$RegionSelectModel {
  factory RegionSelectModel({
    @Default('') String message,
    @Default('') String error
  }) = _RegionSelectModel;

  factory RegionSelectModel.fromJson(Map<String,dynamic> json) => _$RegionSelectModelFromJson(json);

}