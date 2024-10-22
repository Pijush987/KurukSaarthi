import 'package:freezed_annotation/freezed_annotation.dart';
part 'survey_list_model.freezed.dart';
part 'survey_list_model.g.dart';

@freezed
class SurveyListModel with _$SurveyListModel {
  factory SurveyListModel({
    @Default(false)@JsonKey(name: 'success') bool success,
    @Default(0) @JsonKey(name: 'count')int count,
    @Default('') @JsonKey(name: 'message')String message,
    @Default(0) @JsonKey(name: 'limit')int limit,
    @Default(0) @JsonKey(name: 'page') int page,
    @Default([]) @JsonKey(name: 'docs') List<SurveyModel> docs,
  }) = _SurveyListModell;

  factory SurveyListModel.fromJson(Map<String, dynamic> json) => _$SurveyListModelFromJson(json);
}

@freezed
class SurveyModel with _$SurveyModel {
  factory SurveyModel({
    @JsonKey(name: '_id') @Default('') String voterNo,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'age') @Default(0) int age,
    @JsonKey(name: 'gender') @Default('') String gender,
    @JsonKey(name: 'voterIDNumber') @Default('') String voterIDNumber,
    @JsonKey(name: 'boothNumber') @Default('') String boothNumber,
    @JsonKey(name: 'region') @Default('') String region,
    @JsonKey(name: 'pollStatus') @Default('') String pollStatus,
    @JsonKey(name: 'inchargeName') @Default('') String inchargeName,

  }) = _SurveyModel;

  factory SurveyModel.fromJson(Map<String,dynamic> json) => _$SurveyModelFromJson(json);
}