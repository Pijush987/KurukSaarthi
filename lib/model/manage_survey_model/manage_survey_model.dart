
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manage_survey_model.freezed.dart';
part 'manage_survey_model.g.dart';

@freezed
class ManageSurveyModel with _$ManageSurveyModel {
  factory ManageSurveyModel({
    @JsonKey(name: 'inchargeId') @Default('') String inchargeId,
    @Default([]) @JsonKey(name: 'polls') List<Survey> surveys,
  }) = _ManageSurveyModel;

  factory ManageSurveyModel.fromJson(Map<String, dynamic> json) => _$ManageSurveyModelFromJson(json);
}


@freezed
class Survey with _$Survey {
  factory Survey({
    @JsonKey(name: 'pollStatus') @Default('') String pollStatus,
    @JsonKey(name: 'voterIDNumber') @Default('') String voterIDNumber,
    @JsonKey(name: 'isUpdate') @Default(false) bool isUpdate,
  }) = _Survey;

  factory Survey.fromJson(Map<String,dynamic> json) => _$SurveyFromJson(json);
}