// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_survey_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ManageSurveyModelImpl _$$ManageSurveyModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ManageSurveyModelImpl(
      inchargeId: json['inchargeId'] as String? ?? '',
      surveys: (json['polls'] as List<dynamic>?)
              ?.map((e) => Survey.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ManageSurveyModelImplToJson(
        _$ManageSurveyModelImpl instance) =>
    <String, dynamic>{
      'inchargeId': instance.inchargeId,
      'polls': instance.surveys,
    };

_$SurveyImpl _$$SurveyImplFromJson(Map<String, dynamic> json) => _$SurveyImpl(
      pollStatus: json['pollStatus'] as String? ?? '',
      voterIDNumber: json['voterIDNumber'] as String? ?? '',
      isUpdate: json['isUpdate'] as bool? ?? false,
    );

Map<String, dynamic> _$$SurveyImplToJson(_$SurveyImpl instance) =>
    <String, dynamic>{
      'pollStatus': instance.pollStatus,
      'voterIDNumber': instance.voterIDNumber,
      'isUpdate': instance.isUpdate,
    };
