import 'package:freezed_annotation/freezed_annotation.dart';
part 'voter_list_model.freezed.dart';
part 'voter_list_model.g.dart';

@freezed
class VoterListModel with _$VoterListModel {
  factory VoterListModel({
    @Default(false)@JsonKey(name: 'success') bool success,
    @Default(0) @JsonKey(name: 'count')int count,
    @Default('') @JsonKey(name: 'message')String message,
    @Default('') @JsonKey(name: 'limit')String limit,
    @Default('') @JsonKey(name: 'page') String page,
    @Default([]) @JsonKey(name: 'docs') List<VoterModel> docs,
  }) = _VoterListModel;

  factory VoterListModel.fromJson(Map<String, dynamic> json) => _$VoterListModelFromJson(json);
}

@freezed

class VoterModel with _$VoterModel {
  factory VoterModel({
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'age') @Default(0) int age,
    @JsonKey(name: 'gender') @Default('') String gender,
    @JsonKey(name: 'address') @Default('') String address,
    @JsonKey(name: 'voterIDNumber') @Default('') String voterIDNumber,
    @JsonKey(name: 'boothNumber') @Default('') String boothNumber,
    @JsonKey(name: 'boothAddress') @Default('') String boothAddress,
    @JsonKey(name: 'region') @Default('') String region,
    @JsonKey(name: 'subDivision') @Default('') String subDivision,
    @JsonKey(name: 'district') @Default('') String district,
    @JsonKey(name: 'pinCode') @Default('') String pinCode,
    @JsonKey(name: 'assembly') @Default('') String assembly,
    @JsonKey(name: 'assemblyNumber') @Default('') String assemblyNumber,
    @JsonKey(name: 'state') @Default('') String state,
  }) = _VoterModel;

  factory VoterModel.fromJson(Map<String,dynamic> json) => _$VoterModelFromJson(json);
}