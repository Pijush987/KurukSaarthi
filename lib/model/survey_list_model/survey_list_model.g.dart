// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SurveyListModellImpl _$$SurveyListModellImplFromJson(
        Map<String, dynamic> json) =>
    _$SurveyListModellImpl(
      success: json['success'] as bool? ?? false,
      count: (json['count'] as num?)?.toInt() ?? 0,
      code: (json['code'] as num?)?.toInt() ?? 0,
      message: json['message'] as String? ?? '',
      limit: (json['limit'] as num?)?.toInt() ?? 0,
      page: (json['page'] as num?)?.toInt() ?? 0,
      docs: (json['docs'] as List<dynamic>?)
              ?.map((e) => SurveyModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SurveyListModellImplToJson(
        _$SurveyListModellImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'code': instance.code,
      'message': instance.message,
      'limit': instance.limit,
      'page': instance.page,
      'docs': instance.docs,
    };

_$SurveyModelImpl _$$SurveyModelImplFromJson(Map<String, dynamic> json) =>
    _$SurveyModelImpl(
      voterNo: json['_id'] as String? ?? '',
      partyPlus: (json['partyPlus'] as num?)?.toInt() ?? 0,
      partyMinus: (json['partyMinus'] as num?)?.toInt() ?? 0,
      neutral: (json['neutral'] as num?)?.toInt() ?? 0,
      dead: (json['dead'] as num?)?.toInt() ?? 0,
      count: (json['count'] as num?)?.toInt() ?? 0,
      inchargeName: json['inchargeName'] as String? ?? '',
    );

Map<String, dynamic> _$$SurveyModelImplToJson(_$SurveyModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.voterNo,
      'partyPlus': instance.partyPlus,
      'partyMinus': instance.partyMinus,
      'neutral': instance.neutral,
      'dead': instance.dead,
      'count': instance.count,
      'inchargeName': instance.inchargeName,
    };
