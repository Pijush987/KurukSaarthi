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
    @JsonKey(name: 'partyPlus') @Default(0) int partyPlus,
    @JsonKey(name: 'partyMinus') @Default(0) int partyMinus,
    @JsonKey(name: 'neutral') @Default(0) int neutral,
    @JsonKey(name: 'dead') @Default(0) int dead,
    @JsonKey(name: 'count') @Default(0) int count,
    @JsonKey(name: 'inchargeName') @Default('') String inchargeName,

  }) = _SurveyModel;

  factory SurveyModel.fromJson(Map<String,dynamic> json) => _$SurveyModelFromJson(json);
}