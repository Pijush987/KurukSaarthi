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
      'message': instance.message,
      'limit': instance.limit,
      'page': instance.page,
      'docs': instance.docs,
    };

_$SurveyModelImpl _$$SurveyModelImplFromJson(Map<String, dynamic> json) =>
    _$SurveyModelImpl(
      voterNo: json['_id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      age: (json['age'] as num?)?.toInt() ?? 0,
      gender: json['gender'] as String? ?? '',
      voterIDNumber: json['voterIDNumber'] as String? ?? '',
      boothNumber: json['boothNumber'] as String? ?? '',
      region: json['region'] as String? ?? '',
      pollStatus: json['pollStatus'] as String? ?? '',
      inchargeName: json['inchargeName'] as String? ?? '',
    );

Map<String, dynamic> _$$SurveyModelImplToJson(_$SurveyModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.voterNo,
      'name': instance.name,
      'age': instance.age,
      'gender': instance.gender,
      'voterIDNumber': instance.voterIDNumber,
      'boothNumber': instance.boothNumber,
      'region': instance.region,
      'pollStatus': instance.pollStatus,
      'inchargeName': instance.inchargeName,
    };
