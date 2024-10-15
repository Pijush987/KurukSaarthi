// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_static_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SurveyStaticModelImpl _$$SurveyStaticModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SurveyStaticModelImpl(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      docs: json['doc'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$SurveyStaticModelImplToJson(
        _$SurveyStaticModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'doc': instance.docs,
    };
