// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voter_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VoterListModel _$VoterListModelFromJson(Map<String, dynamic> json) {
  return _VoterListModel.fromJson(json);
}

/// @nodoc
mixin _$VoterListModel {
  @JsonKey(name: 'success')
  bool get success => throw _privateConstructorUsedError;
  @JsonKey(name: 'count')
  int get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  int get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'limit')
  String get limit => throw _privateConstructorUsedError;
  @JsonKey(name: 'page')
  String get page => throw _privateConstructorUsedError;
  @JsonKey(name: 'docs')
  List<VoterModel> get docs => throw _privateConstructorUsedError;

  /// Serializes this VoterListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VoterListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VoterListModelCopyWith<VoterListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoterListModelCopyWith<$Res> {
  factory $VoterListModelCopyWith(
          VoterListModel value, $Res Function(VoterListModel) then) =
      _$VoterListModelCopyWithImpl<$Res, VoterListModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'success') bool success,
      @JsonKey(name: 'count') int count,
      @JsonKey(name: 'code') int code,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'limit') String limit,
      @JsonKey(name: 'page') String page,
      @JsonKey(name: 'docs') List<VoterModel> docs});
}

/// @nodoc
class _$VoterListModelCopyWithImpl<$Res, $Val extends VoterListModel>
    implements $VoterListModelCopyWith<$Res> {
  _$VoterListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VoterListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? count = null,
    Object? code = null,
    Object? message = null,
    Object? limit = null,
    Object? page = null,
    Object? docs = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as String,
      docs: null == docs
          ? _value.docs
          : docs // ignore: cast_nullable_to_non_nullable
              as List<VoterModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VoterListModelImplCopyWith<$Res>
    implements $VoterListModelCopyWith<$Res> {
  factory _$$VoterListModelImplCopyWith(_$VoterListModelImpl value,
          $Res Function(_$VoterListModelImpl) then) =
      __$$VoterListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'success') bool success,
      @JsonKey(name: 'count') int count,
      @JsonKey(name: 'code') int code,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'limit') String limit,
      @JsonKey(name: 'page') String page,
      @JsonKey(name: 'docs') List<VoterModel> docs});
}

/// @nodoc
class __$$VoterListModelImplCopyWithImpl<$Res>
    extends _$VoterListModelCopyWithImpl<$Res, _$VoterListModelImpl>
    implements _$$VoterListModelImplCopyWith<$Res> {
  __$$VoterListModelImplCopyWithImpl(
      _$VoterListModelImpl _value, $Res Function(_$VoterListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VoterListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? count = null,
    Object? code = null,
    Object? message = null,
    Object? limit = null,
    Object? page = null,
    Object? docs = null,
  }) {
    return _then(_$VoterListModelImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as String,
      docs: null == docs
          ? _value._docs
          : docs // ignore: cast_nullable_to_non_nullable
              as List<VoterModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VoterListModelImpl implements _VoterListModel {
  _$VoterListModelImpl(
      {@JsonKey(name: 'success') this.success = false,
      @JsonKey(name: 'count') this.count = 0,
      @JsonKey(name: 'code') this.code = 0,
      @JsonKey(name: 'message') this.message = '',
      @JsonKey(name: 'limit') this.limit = '',
      @JsonKey(name: 'page') this.page = '',
      @JsonKey(name: 'docs') final List<VoterModel> docs = const []})
      : _docs = docs;

  factory _$VoterListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VoterListModelImplFromJson(json);

  @override
  @JsonKey(name: 'success')
  final bool success;
  @override
  @JsonKey(name: 'count')
  final int count;
  @override
  @JsonKey(name: 'code')
  final int code;
  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'limit')
  final String limit;
  @override
  @JsonKey(name: 'page')
  final String page;
  final List<VoterModel> _docs;
  @override
  @JsonKey(name: 'docs')
  List<VoterModel> get docs {
    if (_docs is EqualUnmodifiableListView) return _docs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_docs);
  }

  @override
  String toString() {
    return 'VoterListModel(success: $success, count: $count, code: $code, message: $message, limit: $limit, page: $page, docs: $docs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoterListModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._docs, _docs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, count, code, message,
      limit, page, const DeepCollectionEquality().hash(_docs));

  /// Create a copy of VoterListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VoterListModelImplCopyWith<_$VoterListModelImpl> get copyWith =>
      __$$VoterListModelImplCopyWithImpl<_$VoterListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoterListModelImplToJson(
      this,
    );
  }
}

abstract class _VoterListModel implements VoterListModel {
  factory _VoterListModel(
          {@JsonKey(name: 'success') final bool success,
          @JsonKey(name: 'count') final int count,
          @JsonKey(name: 'code') final int code,
          @JsonKey(name: 'message') final String message,
          @JsonKey(name: 'limit') final String limit,
          @JsonKey(name: 'page') final String page,
          @JsonKey(name: 'docs') final List<VoterModel> docs}) =
      _$VoterListModelImpl;

  factory _VoterListModel.fromJson(Map<String, dynamic> json) =
      _$VoterListModelImpl.fromJson;

  @override
  @JsonKey(name: 'success')
  bool get success;
  @override
  @JsonKey(name: 'count')
  int get count;
  @override
  @JsonKey(name: 'code')
  int get code;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'limit')
  String get limit;
  @override
  @JsonKey(name: 'page')
  String get page;
  @override
  @JsonKey(name: 'docs')
  List<VoterModel> get docs;

  /// Create a copy of VoterListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VoterListModelImplCopyWith<_$VoterListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VoterModel _$VoterModelFromJson(Map<String, dynamic> json) {
  return _VoterModel.fromJson(json);
}

/// @nodoc
mixin _$VoterModel {
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'age')
  int get age => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  String get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'voterIDNumber')
  String get voterIDNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'boothNumber')
  String get boothNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'boothAddress')
  String get boothAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'region')
  String get region => throw _privateConstructorUsedError;
  @JsonKey(name: 'subDivision')
  String get subDivision => throw _privateConstructorUsedError;
  @JsonKey(name: 'district')
  String get district => throw _privateConstructorUsedError;
  @JsonKey(name: 'pinCode')
  String get pinCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'assembly')
  String get assembly => throw _privateConstructorUsedError;
  @JsonKey(name: 'assemblyNumber')
  String get assemblyNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'state')
  String get state => throw _privateConstructorUsedError;

  /// Serializes this VoterModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VoterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VoterModelCopyWith<VoterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoterModelCopyWith<$Res> {
  factory $VoterModelCopyWith(
          VoterModel value, $Res Function(VoterModel) then) =
      _$VoterModelCopyWithImpl<$Res, VoterModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'age') int age,
      @JsonKey(name: 'gender') String gender,
      @JsonKey(name: 'address') String address,
      @JsonKey(name: 'voterIDNumber') String voterIDNumber,
      @JsonKey(name: 'boothNumber') String boothNumber,
      @JsonKey(name: 'boothAddress') String boothAddress,
      @JsonKey(name: 'region') String region,
      @JsonKey(name: 'subDivision') String subDivision,
      @JsonKey(name: 'district') String district,
      @JsonKey(name: 'pinCode') String pinCode,
      @JsonKey(name: 'assembly') String assembly,
      @JsonKey(name: 'assemblyNumber') String assemblyNumber,
      @JsonKey(name: 'state') String state});
}

/// @nodoc
class _$VoterModelCopyWithImpl<$Res, $Val extends VoterModel>
    implements $VoterModelCopyWith<$Res> {
  _$VoterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VoterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? age = null,
    Object? gender = null,
    Object? address = null,
    Object? voterIDNumber = null,
    Object? boothNumber = null,
    Object? boothAddress = null,
    Object? region = null,
    Object? subDivision = null,
    Object? district = null,
    Object? pinCode = null,
    Object? assembly = null,
    Object? assemblyNumber = null,
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      voterIDNumber: null == voterIDNumber
          ? _value.voterIDNumber
          : voterIDNumber // ignore: cast_nullable_to_non_nullable
              as String,
      boothNumber: null == boothNumber
          ? _value.boothNumber
          : boothNumber // ignore: cast_nullable_to_non_nullable
              as String,
      boothAddress: null == boothAddress
          ? _value.boothAddress
          : boothAddress // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      subDivision: null == subDivision
          ? _value.subDivision
          : subDivision // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      pinCode: null == pinCode
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String,
      assembly: null == assembly
          ? _value.assembly
          : assembly // ignore: cast_nullable_to_non_nullable
              as String,
      assemblyNumber: null == assemblyNumber
          ? _value.assemblyNumber
          : assemblyNumber // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VoterModelImplCopyWith<$Res>
    implements $VoterModelCopyWith<$Res> {
  factory _$$VoterModelImplCopyWith(
          _$VoterModelImpl value, $Res Function(_$VoterModelImpl) then) =
      __$$VoterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'age') int age,
      @JsonKey(name: 'gender') String gender,
      @JsonKey(name: 'address') String address,
      @JsonKey(name: 'voterIDNumber') String voterIDNumber,
      @JsonKey(name: 'boothNumber') String boothNumber,
      @JsonKey(name: 'boothAddress') String boothAddress,
      @JsonKey(name: 'region') String region,
      @JsonKey(name: 'subDivision') String subDivision,
      @JsonKey(name: 'district') String district,
      @JsonKey(name: 'pinCode') String pinCode,
      @JsonKey(name: 'assembly') String assembly,
      @JsonKey(name: 'assemblyNumber') String assemblyNumber,
      @JsonKey(name: 'state') String state});
}

/// @nodoc
class __$$VoterModelImplCopyWithImpl<$Res>
    extends _$VoterModelCopyWithImpl<$Res, _$VoterModelImpl>
    implements _$$VoterModelImplCopyWith<$Res> {
  __$$VoterModelImplCopyWithImpl(
      _$VoterModelImpl _value, $Res Function(_$VoterModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VoterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? age = null,
    Object? gender = null,
    Object? address = null,
    Object? voterIDNumber = null,
    Object? boothNumber = null,
    Object? boothAddress = null,
    Object? region = null,
    Object? subDivision = null,
    Object? district = null,
    Object? pinCode = null,
    Object? assembly = null,
    Object? assemblyNumber = null,
    Object? state = null,
  }) {
    return _then(_$VoterModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      voterIDNumber: null == voterIDNumber
          ? _value.voterIDNumber
          : voterIDNumber // ignore: cast_nullable_to_non_nullable
              as String,
      boothNumber: null == boothNumber
          ? _value.boothNumber
          : boothNumber // ignore: cast_nullable_to_non_nullable
              as String,
      boothAddress: null == boothAddress
          ? _value.boothAddress
          : boothAddress // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      subDivision: null == subDivision
          ? _value.subDivision
          : subDivision // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      pinCode: null == pinCode
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String,
      assembly: null == assembly
          ? _value.assembly
          : assembly // ignore: cast_nullable_to_non_nullable
              as String,
      assemblyNumber: null == assemblyNumber
          ? _value.assemblyNumber
          : assemblyNumber // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VoterModelImpl implements _VoterModel {
  _$VoterModelImpl(
      {@JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'age') this.age = 0,
      @JsonKey(name: 'gender') this.gender = '',
      @JsonKey(name: 'address') this.address = '',
      @JsonKey(name: 'voterIDNumber') this.voterIDNumber = '',
      @JsonKey(name: 'boothNumber') this.boothNumber = '',
      @JsonKey(name: 'boothAddress') this.boothAddress = '',
      @JsonKey(name: 'region') this.region = '',
      @JsonKey(name: 'subDivision') this.subDivision = '',
      @JsonKey(name: 'district') this.district = '',
      @JsonKey(name: 'pinCode') this.pinCode = '',
      @JsonKey(name: 'assembly') this.assembly = '',
      @JsonKey(name: 'assemblyNumber') this.assemblyNumber = '',
      @JsonKey(name: 'state') this.state = ''});

  factory _$VoterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VoterModelImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'age')
  final int age;
  @override
  @JsonKey(name: 'gender')
  final String gender;
  @override
  @JsonKey(name: 'address')
  final String address;
  @override
  @JsonKey(name: 'voterIDNumber')
  final String voterIDNumber;
  @override
  @JsonKey(name: 'boothNumber')
  final String boothNumber;
  @override
  @JsonKey(name: 'boothAddress')
  final String boothAddress;
  @override
  @JsonKey(name: 'region')
  final String region;
  @override
  @JsonKey(name: 'subDivision')
  final String subDivision;
  @override
  @JsonKey(name: 'district')
  final String district;
  @override
  @JsonKey(name: 'pinCode')
  final String pinCode;
  @override
  @JsonKey(name: 'assembly')
  final String assembly;
  @override
  @JsonKey(name: 'assemblyNumber')
  final String assemblyNumber;
  @override
  @JsonKey(name: 'state')
  final String state;

  @override
  String toString() {
    return 'VoterModel(name: $name, age: $age, gender: $gender, address: $address, voterIDNumber: $voterIDNumber, boothNumber: $boothNumber, boothAddress: $boothAddress, region: $region, subDivision: $subDivision, district: $district, pinCode: $pinCode, assembly: $assembly, assemblyNumber: $assemblyNumber, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoterModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.voterIDNumber, voterIDNumber) ||
                other.voterIDNumber == voterIDNumber) &&
            (identical(other.boothNumber, boothNumber) ||
                other.boothNumber == boothNumber) &&
            (identical(other.boothAddress, boothAddress) ||
                other.boothAddress == boothAddress) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.subDivision, subDivision) ||
                other.subDivision == subDivision) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.pinCode, pinCode) || other.pinCode == pinCode) &&
            (identical(other.assembly, assembly) ||
                other.assembly == assembly) &&
            (identical(other.assemblyNumber, assemblyNumber) ||
                other.assemblyNumber == assemblyNumber) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      age,
      gender,
      address,
      voterIDNumber,
      boothNumber,
      boothAddress,
      region,
      subDivision,
      district,
      pinCode,
      assembly,
      assemblyNumber,
      state);

  /// Create a copy of VoterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VoterModelImplCopyWith<_$VoterModelImpl> get copyWith =>
      __$$VoterModelImplCopyWithImpl<_$VoterModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoterModelImplToJson(
      this,
    );
  }
}

abstract class _VoterModel implements VoterModel {
  factory _VoterModel(
      {@JsonKey(name: 'name') final String name,
      @JsonKey(name: 'age') final int age,
      @JsonKey(name: 'gender') final String gender,
      @JsonKey(name: 'address') final String address,
      @JsonKey(name: 'voterIDNumber') final String voterIDNumber,
      @JsonKey(name: 'boothNumber') final String boothNumber,
      @JsonKey(name: 'boothAddress') final String boothAddress,
      @JsonKey(name: 'region') final String region,
      @JsonKey(name: 'subDivision') final String subDivision,
      @JsonKey(name: 'district') final String district,
      @JsonKey(name: 'pinCode') final String pinCode,
      @JsonKey(name: 'assembly') final String assembly,
      @JsonKey(name: 'assemblyNumber') final String assemblyNumber,
      @JsonKey(name: 'state') final String state}) = _$VoterModelImpl;

  factory _VoterModel.fromJson(Map<String, dynamic> json) =
      _$VoterModelImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'age')
  int get age;
  @override
  @JsonKey(name: 'gender')
  String get gender;
  @override
  @JsonKey(name: 'address')
  String get address;
  @override
  @JsonKey(name: 'voterIDNumber')
  String get voterIDNumber;
  @override
  @JsonKey(name: 'boothNumber')
  String get boothNumber;
  @override
  @JsonKey(name: 'boothAddress')
  String get boothAddress;
  @override
  @JsonKey(name: 'region')
  String get region;
  @override
  @JsonKey(name: 'subDivision')
  String get subDivision;
  @override
  @JsonKey(name: 'district')
  String get district;
  @override
  @JsonKey(name: 'pinCode')
  String get pinCode;
  @override
  @JsonKey(name: 'assembly')
  String get assembly;
  @override
  @JsonKey(name: 'assemblyNumber')
  String get assemblyNumber;
  @override
  @JsonKey(name: 'state')
  String get state;

  /// Create a copy of VoterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VoterModelImplCopyWith<_$VoterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
