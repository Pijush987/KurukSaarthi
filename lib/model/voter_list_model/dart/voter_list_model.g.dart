// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voter_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VoterListModelImpl _$$VoterListModelImplFromJson(Map<String, dynamic> json) =>
    _$VoterListModelImpl(
      success: json['success'] as bool? ?? false,
      count: (json['count'] as num?)?.toInt() ?? 0,
      message: json['message'] as String? ?? '',
      limit: json['limit'] as String? ?? '',
      page: json['page'] as String? ?? '',
      docs: (json['docs'] as List<dynamic>?)
              ?.map((e) => VoterModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$VoterListModelImplToJson(
        _$VoterListModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'message': instance.message,
      'limit': instance.limit,
      'page': instance.page,
      'docs': instance.docs,
    };

_$VoterModelImpl _$$VoterModelImplFromJson(Map<String, dynamic> json) =>
    _$VoterModelImpl(
      name: json['name'] as String? ?? '',
      age: (json['age'] as num?)?.toInt() ?? 0,
      gender: json['gender'] as String? ?? '',
      address: json['address'] as String? ?? '',
      voterIDNumber: json['voterIDNumber'] as String? ?? '',
      boothNumber: json['boothNumber'] as String? ?? '',
      boothAddress: json['boothAddress'] as String? ?? '',
      region: json['region'] as String? ?? '',
      subDivision: json['subDivision'] as String? ?? '',
      district: json['district'] as String? ?? '',
      pinCode: json['pinCode'] as String? ?? '',
      assembly: json['assembly'] as String? ?? '',
      assemblyNumber: json['assemblyNumber'] as String? ?? '',
      state: json['state'] as String? ?? '',
    );

Map<String, dynamic> _$$VoterModelImplToJson(_$VoterModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'gender': instance.gender,
      'address': instance.address,
      'voterIDNumber': instance.voterIDNumber,
      'boothNumber': instance.boothNumber,
      'boothAddress': instance.boothAddress,
      'region': instance.region,
      'subDivision': instance.subDivision,
      'district': instance.district,
      'pinCode': instance.pinCode,
      'assembly': instance.assembly,
      'assemblyNumber': instance.assemblyNumber,
      'state': instance.state,
    };
