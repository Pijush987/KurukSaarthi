// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_survey_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ManageSurveyModel _$ManageSurveyModelFromJson(Map<String, dynamic> json) {
  return _ManageSurveyModel.fromJson(json);
}

/// @nodoc
mixin _$ManageSurveyModel {
  @JsonKey(name: 'inchargeId')
  String get inchargeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'polls')
  List<Survey> get surveys => throw _privateConstructorUsedError;

  /// Serializes this ManageSurveyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ManageSurveyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ManageSurveyModelCopyWith<ManageSurveyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManageSurveyModelCopyWith<$Res> {
  factory $ManageSurveyModelCopyWith(
          ManageSurveyModel value, $Res Function(ManageSurveyModel) then) =
      _$ManageSurveyModelCopyWithImpl<$Res, ManageSurveyModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'inchargeId') String inchargeId,
      @JsonKey(name: 'polls') List<Survey> surveys});
}

/// @nodoc
class _$ManageSurveyModelCopyWithImpl<$Res, $Val extends ManageSurveyModel>
    implements $ManageSurveyModelCopyWith<$Res> {
  _$ManageSurveyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ManageSurveyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inchargeId = null,
    Object? surveys = null,
  }) {
    return _then(_value.copyWith(
      inchargeId: null == inchargeId
          ? _value.inchargeId
          : inchargeId // ignore: cast_nullable_to_non_nullable
              as String,
      surveys: null == surveys
          ? _value.surveys
          : surveys // ignore: cast_nullable_to_non_nullable
              as List<Survey>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ManageSurveyModelImplCopyWith<$Res>
    implements $ManageSurveyModelCopyWith<$Res> {
  factory _$$ManageSurveyModelImplCopyWith(_$ManageSurveyModelImpl value,
          $Res Function(_$ManageSurveyModelImpl) then) =
      __$$ManageSurveyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'inchargeId') String inchargeId,
      @JsonKey(name: 'polls') List<Survey> surveys});
}

/// @nodoc
class __$$ManageSurveyModelImplCopyWithImpl<$Res>
    extends _$ManageSurveyModelCopyWithImpl<$Res, _$ManageSurveyModelImpl>
    implements _$$ManageSurveyModelImplCopyWith<$Res> {
  __$$ManageSurveyModelImplCopyWithImpl(_$ManageSurveyModelImpl _value,
      $Res Function(_$ManageSurveyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ManageSurveyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inchargeId = null,
    Object? surveys = null,
  }) {
    return _then(_$ManageSurveyModelImpl(
      inchargeId: null == inchargeId
          ? _value.inchargeId
          : inchargeId // ignore: cast_nullable_to_non_nullable
              as String,
      surveys: null == surveys
          ? _value._surveys
          : surveys // ignore: cast_nullable_to_non_nullable
              as List<Survey>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ManageSurveyModelImpl implements _ManageSurveyModel {
  _$ManageSurveyModelImpl(
      {@JsonKey(name: 'inchargeId') this.inchargeId = '',
      @JsonKey(name: 'polls') final List<Survey> surveys = const []})
      : _surveys = surveys;

  factory _$ManageSurveyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ManageSurveyModelImplFromJson(json);

  @override
  @JsonKey(name: 'inchargeId')
  final String inchargeId;
  final List<Survey> _surveys;
  @override
  @JsonKey(name: 'polls')
  List<Survey> get surveys {
    if (_surveys is EqualUnmodifiableListView) return _surveys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_surveys);
  }

  @override
  String toString() {
    return 'ManageSurveyModel(inchargeId: $inchargeId, surveys: $surveys)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManageSurveyModelImpl &&
            (identical(other.inchargeId, inchargeId) ||
                other.inchargeId == inchargeId) &&
            const DeepCollectionEquality().equals(other._surveys, _surveys));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, inchargeId, const DeepCollectionEquality().hash(_surveys));

  /// Create a copy of ManageSurveyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ManageSurveyModelImplCopyWith<_$ManageSurveyModelImpl> get copyWith =>
      __$$ManageSurveyModelImplCopyWithImpl<_$ManageSurveyModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ManageSurveyModelImplToJson(
      this,
    );
  }
}

abstract class _ManageSurveyModel implements ManageSurveyModel {
  factory _ManageSurveyModel(
          {@JsonKey(name: 'inchargeId') final String inchargeId,
          @JsonKey(name: 'polls') final List<Survey> surveys}) =
      _$ManageSurveyModelImpl;

  factory _ManageSurveyModel.fromJson(Map<String, dynamic> json) =
      _$ManageSurveyModelImpl.fromJson;

  @override
  @JsonKey(name: 'inchargeId')
  String get inchargeId;
  @override
  @JsonKey(name: 'polls')
  List<Survey> get surveys;

  /// Create a copy of ManageSurveyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManageSurveyModelImplCopyWith<_$ManageSurveyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Survey _$SurveyFromJson(Map<String, dynamic> json) {
  return _Survey.fromJson(json);
}

/// @nodoc
mixin _$Survey {
  @JsonKey(name: 'pollStatus')
  String get pollStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'voterIDNumber')
  String get voterIDNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'isUpdate')
  bool get isUpdate => throw _privateConstructorUsedError;

  /// Serializes this Survey to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Survey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SurveyCopyWith<Survey> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyCopyWith<$Res> {
  factory $SurveyCopyWith(Survey value, $Res Function(Survey) then) =
      _$SurveyCopyWithImpl<$Res, Survey>;
  @useResult
  $Res call(
      {@JsonKey(name: 'pollStatus') String pollStatus,
      @JsonKey(name: 'voterIDNumber') String voterIDNumber,
      @JsonKey(name: 'isUpdate') bool isUpdate});
}

/// @nodoc
class _$SurveyCopyWithImpl<$Res, $Val extends Survey>
    implements $SurveyCopyWith<$Res> {
  _$SurveyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Survey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pollStatus = null,
    Object? voterIDNumber = null,
    Object? isUpdate = null,
  }) {
    return _then(_value.copyWith(
      pollStatus: null == pollStatus
          ? _value.pollStatus
          : pollStatus // ignore: cast_nullable_to_non_nullable
              as String,
      voterIDNumber: null == voterIDNumber
          ? _value.voterIDNumber
          : voterIDNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isUpdate: null == isUpdate
          ? _value.isUpdate
          : isUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SurveyImplCopyWith<$Res> implements $SurveyCopyWith<$Res> {
  factory _$$SurveyImplCopyWith(
          _$SurveyImpl value, $Res Function(_$SurveyImpl) then) =
      __$$SurveyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'pollStatus') String pollStatus,
      @JsonKey(name: 'voterIDNumber') String voterIDNumber,
      @JsonKey(name: 'isUpdate') bool isUpdate});
}

/// @nodoc
class __$$SurveyImplCopyWithImpl<$Res>
    extends _$SurveyCopyWithImpl<$Res, _$SurveyImpl>
    implements _$$SurveyImplCopyWith<$Res> {
  __$$SurveyImplCopyWithImpl(
      _$SurveyImpl _value, $Res Function(_$SurveyImpl) _then)
      : super(_value, _then);

  /// Create a copy of Survey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pollStatus = null,
    Object? voterIDNumber = null,
    Object? isUpdate = null,
  }) {
    return _then(_$SurveyImpl(
      pollStatus: null == pollStatus
          ? _value.pollStatus
          : pollStatus // ignore: cast_nullable_to_non_nullable
              as String,
      voterIDNumber: null == voterIDNumber
          ? _value.voterIDNumber
          : voterIDNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isUpdate: null == isUpdate
          ? _value.isUpdate
          : isUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SurveyImpl implements _Survey {
  _$SurveyImpl(
      {@JsonKey(name: 'pollStatus') this.pollStatus = '',
      @JsonKey(name: 'voterIDNumber') this.voterIDNumber = '',
      @JsonKey(name: 'isUpdate') this.isUpdate = false});

  factory _$SurveyImpl.fromJson(Map<String, dynamic> json) =>
      _$$SurveyImplFromJson(json);

  @override
  @JsonKey(name: 'pollStatus')
  final String pollStatus;
  @override
  @JsonKey(name: 'voterIDNumber')
  final String voterIDNumber;
  @override
  @JsonKey(name: 'isUpdate')
  final bool isUpdate;

  @override
  String toString() {
    return 'Survey(pollStatus: $pollStatus, voterIDNumber: $voterIDNumber, isUpdate: $isUpdate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SurveyImpl &&
            (identical(other.pollStatus, pollStatus) ||
                other.pollStatus == pollStatus) &&
            (identical(other.voterIDNumber, voterIDNumber) ||
                other.voterIDNumber == voterIDNumber) &&
            (identical(other.isUpdate, isUpdate) ||
                other.isUpdate == isUpdate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, pollStatus, voterIDNumber, isUpdate);

  /// Create a copy of Survey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SurveyImplCopyWith<_$SurveyImpl> get copyWith =>
      __$$SurveyImplCopyWithImpl<_$SurveyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SurveyImplToJson(
      this,
    );
  }
}

abstract class _Survey implements Survey {
  factory _Survey(
      {@JsonKey(name: 'pollStatus') final String pollStatus,
      @JsonKey(name: 'voterIDNumber') final String voterIDNumber,
      @JsonKey(name: 'isUpdate') final bool isUpdate}) = _$SurveyImpl;

  factory _Survey.fromJson(Map<String, dynamic> json) = _$SurveyImpl.fromJson;

  @override
  @JsonKey(name: 'pollStatus')
  String get pollStatus;
  @override
  @JsonKey(name: 'voterIDNumber')
  String get voterIDNumber;
  @override
  @JsonKey(name: 'isUpdate')
  bool get isUpdate;

  /// Create a copy of Survey
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SurveyImplCopyWith<_$SurveyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
