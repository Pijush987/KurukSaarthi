// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'survey_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SurveyListModel _$SurveyListModelFromJson(Map<String, dynamic> json) {
  return _SurveyListModell.fromJson(json);
}

/// @nodoc
mixin _$SurveyListModel {
  @JsonKey(name: 'success')
  bool get success => throw _privateConstructorUsedError;
  @JsonKey(name: 'count')
  int get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'limit')
  int get limit => throw _privateConstructorUsedError;
  @JsonKey(name: 'page')
  int get page => throw _privateConstructorUsedError;
  @JsonKey(name: 'docs')
  List<SurveyModel> get docs => throw _privateConstructorUsedError;

  /// Serializes this SurveyListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SurveyListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SurveyListModelCopyWith<SurveyListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyListModelCopyWith<$Res> {
  factory $SurveyListModelCopyWith(
          SurveyListModel value, $Res Function(SurveyListModel) then) =
      _$SurveyListModelCopyWithImpl<$Res, SurveyListModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'success') bool success,
      @JsonKey(name: 'count') int count,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'limit') int limit,
      @JsonKey(name: 'page') int page,
      @JsonKey(name: 'docs') List<SurveyModel> docs});
}

/// @nodoc
class _$SurveyListModelCopyWithImpl<$Res, $Val extends SurveyListModel>
    implements $SurveyListModelCopyWith<$Res> {
  _$SurveyListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SurveyListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? count = null,
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
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      docs: null == docs
          ? _value.docs
          : docs // ignore: cast_nullable_to_non_nullable
              as List<SurveyModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SurveyListModellImplCopyWith<$Res>
    implements $SurveyListModelCopyWith<$Res> {
  factory _$$SurveyListModellImplCopyWith(_$SurveyListModellImpl value,
          $Res Function(_$SurveyListModellImpl) then) =
      __$$SurveyListModellImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'success') bool success,
      @JsonKey(name: 'count') int count,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'limit') int limit,
      @JsonKey(name: 'page') int page,
      @JsonKey(name: 'docs') List<SurveyModel> docs});
}

/// @nodoc
class __$$SurveyListModellImplCopyWithImpl<$Res>
    extends _$SurveyListModelCopyWithImpl<$Res, _$SurveyListModellImpl>
    implements _$$SurveyListModellImplCopyWith<$Res> {
  __$$SurveyListModellImplCopyWithImpl(_$SurveyListModellImpl _value,
      $Res Function(_$SurveyListModellImpl) _then)
      : super(_value, _then);

  /// Create a copy of SurveyListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? count = null,
    Object? message = null,
    Object? limit = null,
    Object? page = null,
    Object? docs = null,
  }) {
    return _then(_$SurveyListModellImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      docs: null == docs
          ? _value._docs
          : docs // ignore: cast_nullable_to_non_nullable
              as List<SurveyModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SurveyListModellImpl implements _SurveyListModell {
  _$SurveyListModellImpl(
      {@JsonKey(name: 'success') this.success = false,
      @JsonKey(name: 'count') this.count = 0,
      @JsonKey(name: 'message') this.message = '',
      @JsonKey(name: 'limit') this.limit = 0,
      @JsonKey(name: 'page') this.page = 0,
      @JsonKey(name: 'docs') final List<SurveyModel> docs = const []})
      : _docs = docs;

  factory _$SurveyListModellImpl.fromJson(Map<String, dynamic> json) =>
      _$$SurveyListModellImplFromJson(json);

  @override
  @JsonKey(name: 'success')
  final bool success;
  @override
  @JsonKey(name: 'count')
  final int count;
  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'limit')
  final int limit;
  @override
  @JsonKey(name: 'page')
  final int page;
  final List<SurveyModel> _docs;
  @override
  @JsonKey(name: 'docs')
  List<SurveyModel> get docs {
    if (_docs is EqualUnmodifiableListView) return _docs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_docs);
  }

  @override
  String toString() {
    return 'SurveyListModel(success: $success, count: $count, message: $message, limit: $limit, page: $page, docs: $docs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SurveyListModellImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._docs, _docs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, count, message, limit,
      page, const DeepCollectionEquality().hash(_docs));

  /// Create a copy of SurveyListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SurveyListModellImplCopyWith<_$SurveyListModellImpl> get copyWith =>
      __$$SurveyListModellImplCopyWithImpl<_$SurveyListModellImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SurveyListModellImplToJson(
      this,
    );
  }
}

abstract class _SurveyListModell implements SurveyListModel {
  factory _SurveyListModell(
          {@JsonKey(name: 'success') final bool success,
          @JsonKey(name: 'count') final int count,
          @JsonKey(name: 'message') final String message,
          @JsonKey(name: 'limit') final int limit,
          @JsonKey(name: 'page') final int page,
          @JsonKey(name: 'docs') final List<SurveyModel> docs}) =
      _$SurveyListModellImpl;

  factory _SurveyListModell.fromJson(Map<String, dynamic> json) =
      _$SurveyListModellImpl.fromJson;

  @override
  @JsonKey(name: 'success')
  bool get success;
  @override
  @JsonKey(name: 'count')
  int get count;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'limit')
  int get limit;
  @override
  @JsonKey(name: 'page')
  int get page;
  @override
  @JsonKey(name: 'docs')
  List<SurveyModel> get docs;

  /// Create a copy of SurveyListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SurveyListModellImplCopyWith<_$SurveyListModellImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SurveyModel _$SurveyModelFromJson(Map<String, dynamic> json) {
  return _SurveyModel.fromJson(json);
}

/// @nodoc
mixin _$SurveyModel {
  @JsonKey(name: '_id')
  String get voterNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'age')
  int get age => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  String get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'voterIDNumber')
  String get voterIDNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'boothNumber')
  String get boothNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'region')
  String get region => throw _privateConstructorUsedError;
  @JsonKey(name: 'pollStatus')
  String get pollStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'inchargeName')
  String get inchargeName => throw _privateConstructorUsedError;

  /// Serializes this SurveyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SurveyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SurveyModelCopyWith<SurveyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyModelCopyWith<$Res> {
  factory $SurveyModelCopyWith(
          SurveyModel value, $Res Function(SurveyModel) then) =
      _$SurveyModelCopyWithImpl<$Res, SurveyModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String voterNo,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'age') int age,
      @JsonKey(name: 'gender') String gender,
      @JsonKey(name: 'voterIDNumber') String voterIDNumber,
      @JsonKey(name: 'boothNumber') String boothNumber,
      @JsonKey(name: 'region') String region,
      @JsonKey(name: 'pollStatus') String pollStatus,
      @JsonKey(name: 'inchargeName') String inchargeName});
}

/// @nodoc
class _$SurveyModelCopyWithImpl<$Res, $Val extends SurveyModel>
    implements $SurveyModelCopyWith<$Res> {
  _$SurveyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SurveyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? voterNo = null,
    Object? name = null,
    Object? age = null,
    Object? gender = null,
    Object? voterIDNumber = null,
    Object? boothNumber = null,
    Object? region = null,
    Object? pollStatus = null,
    Object? inchargeName = null,
  }) {
    return _then(_value.copyWith(
      voterNo: null == voterNo
          ? _value.voterNo
          : voterNo // ignore: cast_nullable_to_non_nullable
              as String,
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
      voterIDNumber: null == voterIDNumber
          ? _value.voterIDNumber
          : voterIDNumber // ignore: cast_nullable_to_non_nullable
              as String,
      boothNumber: null == boothNumber
          ? _value.boothNumber
          : boothNumber // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      pollStatus: null == pollStatus
          ? _value.pollStatus
          : pollStatus // ignore: cast_nullable_to_non_nullable
              as String,
      inchargeName: null == inchargeName
          ? _value.inchargeName
          : inchargeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SurveyModelImplCopyWith<$Res>
    implements $SurveyModelCopyWith<$Res> {
  factory _$$SurveyModelImplCopyWith(
          _$SurveyModelImpl value, $Res Function(_$SurveyModelImpl) then) =
      __$$SurveyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String voterNo,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'age') int age,
      @JsonKey(name: 'gender') String gender,
      @JsonKey(name: 'voterIDNumber') String voterIDNumber,
      @JsonKey(name: 'boothNumber') String boothNumber,
      @JsonKey(name: 'region') String region,
      @JsonKey(name: 'pollStatus') String pollStatus,
      @JsonKey(name: 'inchargeName') String inchargeName});
}

/// @nodoc
class __$$SurveyModelImplCopyWithImpl<$Res>
    extends _$SurveyModelCopyWithImpl<$Res, _$SurveyModelImpl>
    implements _$$SurveyModelImplCopyWith<$Res> {
  __$$SurveyModelImplCopyWithImpl(
      _$SurveyModelImpl _value, $Res Function(_$SurveyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SurveyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? voterNo = null,
    Object? name = null,
    Object? age = null,
    Object? gender = null,
    Object? voterIDNumber = null,
    Object? boothNumber = null,
    Object? region = null,
    Object? pollStatus = null,
    Object? inchargeName = null,
  }) {
    return _then(_$SurveyModelImpl(
      voterNo: null == voterNo
          ? _value.voterNo
          : voterNo // ignore: cast_nullable_to_non_nullable
              as String,
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
      voterIDNumber: null == voterIDNumber
          ? _value.voterIDNumber
          : voterIDNumber // ignore: cast_nullable_to_non_nullable
              as String,
      boothNumber: null == boothNumber
          ? _value.boothNumber
          : boothNumber // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      pollStatus: null == pollStatus
          ? _value.pollStatus
          : pollStatus // ignore: cast_nullable_to_non_nullable
              as String,
      inchargeName: null == inchargeName
          ? _value.inchargeName
          : inchargeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SurveyModelImpl implements _SurveyModel {
  _$SurveyModelImpl(
      {@JsonKey(name: '_id') this.voterNo = '',
      @JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'age') this.age = 0,
      @JsonKey(name: 'gender') this.gender = '',
      @JsonKey(name: 'voterIDNumber') this.voterIDNumber = '',
      @JsonKey(name: 'boothNumber') this.boothNumber = '',
      @JsonKey(name: 'region') this.region = '',
      @JsonKey(name: 'pollStatus') this.pollStatus = '',
      @JsonKey(name: 'inchargeName') this.inchargeName = ''});

  factory _$SurveyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SurveyModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String voterNo;
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
  @JsonKey(name: 'voterIDNumber')
  final String voterIDNumber;
  @override
  @JsonKey(name: 'boothNumber')
  final String boothNumber;
  @override
  @JsonKey(name: 'region')
  final String region;
  @override
  @JsonKey(name: 'pollStatus')
  final String pollStatus;
  @override
  @JsonKey(name: 'inchargeName')
  final String inchargeName;

  @override
  String toString() {
    return 'SurveyModel(voterNo: $voterNo, name: $name, age: $age, gender: $gender, voterIDNumber: $voterIDNumber, boothNumber: $boothNumber, region: $region, pollStatus: $pollStatus, inchargeName: $inchargeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SurveyModelImpl &&
            (identical(other.voterNo, voterNo) || other.voterNo == voterNo) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.voterIDNumber, voterIDNumber) ||
                other.voterIDNumber == voterIDNumber) &&
            (identical(other.boothNumber, boothNumber) ||
                other.boothNumber == boothNumber) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.pollStatus, pollStatus) ||
                other.pollStatus == pollStatus) &&
            (identical(other.inchargeName, inchargeName) ||
                other.inchargeName == inchargeName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, voterNo, name, age, gender,
      voterIDNumber, boothNumber, region, pollStatus, inchargeName);

  /// Create a copy of SurveyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SurveyModelImplCopyWith<_$SurveyModelImpl> get copyWith =>
      __$$SurveyModelImplCopyWithImpl<_$SurveyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SurveyModelImplToJson(
      this,
    );
  }
}

abstract class _SurveyModel implements SurveyModel {
  factory _SurveyModel(
          {@JsonKey(name: '_id') final String voterNo,
          @JsonKey(name: 'name') final String name,
          @JsonKey(name: 'age') final int age,
          @JsonKey(name: 'gender') final String gender,
          @JsonKey(name: 'voterIDNumber') final String voterIDNumber,
          @JsonKey(name: 'boothNumber') final String boothNumber,
          @JsonKey(name: 'region') final String region,
          @JsonKey(name: 'pollStatus') final String pollStatus,
          @JsonKey(name: 'inchargeName') final String inchargeName}) =
      _$SurveyModelImpl;

  factory _SurveyModel.fromJson(Map<String, dynamic> json) =
      _$SurveyModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get voterNo;
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
  @JsonKey(name: 'voterIDNumber')
  String get voterIDNumber;
  @override
  @JsonKey(name: 'boothNumber')
  String get boothNumber;
  @override
  @JsonKey(name: 'region')
  String get region;
  @override
  @JsonKey(name: 'pollStatus')
  String get pollStatus;
  @override
  @JsonKey(name: 'inchargeName')
  String get inchargeName;

  /// Create a copy of SurveyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SurveyModelImplCopyWith<_$SurveyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
