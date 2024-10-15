

import 'package:freezed_annotation/freezed_annotation.dart';
part 'survey_static_model.freezed.dart';
part 'survey_static_model.g.dart';

@freezed
class SurveyStaticModel with _$SurveyStaticModel {
  factory SurveyStaticModel({
    @Default(false)@JsonKey(name: 'success') bool success,
    @Default('') @JsonKey(name: 'message')String message,
    @Default({}) @JsonKey(name: 'doc') Map<String,dynamic> docs,
  }) = _SurveyStaticModel;

  factory SurveyStaticModel.fromJson(Map<String, dynamic> json) => _$SurveyStaticModelFromJson(json);
}

// @freezed
// class SurveyStatic with _$SurveyStatic {
//   factory SurveyStatic({
//     @JsonKey(name: 'PARTY_PLUS') @Default('') String partyPlus,
//     @JsonKey(name: 'PARTY_MINUS') @Default('') String partyMinus,
//     @JsonKey(name: 'NEUTRAL') @Default('') String neutral,
//     @JsonKey(name: 'DEAD') @Default('') String dead,
//     @JsonKey(name: 'total') @Default('') String total,
//
//   }) = _SurveyStaticl;
//
//   factory SurveyStatic.fromJson(Map<String,dynamic> json) => _$SurveyStaticFromJson(json);
// }