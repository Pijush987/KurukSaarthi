// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'survey_static_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SurveyStaticModel _$SurveyStaticModelFromJson(Map<String, dynamic> json) {
  return _SurveyStaticModel.fromJson(json);
}

/// @nodoc
mixin _$SurveyStaticModel {
  @JsonKey(name: 'success')
  bool get success => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'doc')
  Map<String, dynamic> get docs => throw _privateConstructorUsedError;

  /// Serializes this SurveyStaticModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SurveyStaticModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SurveyStaticModelCopyWith<SurveyStaticModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyStaticModelCopyWith<$Res> {
  factory $SurveyStaticModelCopyWith(
          SurveyStaticModel value, $Res Function(SurveyStaticModel) then) =
      _$SurveyStaticModelCopyWithImpl<$Res, SurveyStaticModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'success') bool success,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'doc') Map<String, dynamic> docs});
}

/// @nodoc
class _$SurveyStaticModelCopyWithImpl<$Res, $Val extends SurveyStaticModel>
    implements $SurveyStaticModelCopyWith<$Res> {
  _$SurveyStaticModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SurveyStaticModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? docs = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      docs: null == docs
          ? _value.docs
          : docs // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SurveyStaticModelImplCopyWith<$Res>
    implements $SurveyStaticModelCopyWith<$Res> {
  factory _$$SurveyStaticModelImplCopyWith(_$SurveyStaticModelImpl value,
          $Res Function(_$SurveyStaticModelImpl) then) =
      __$$SurveyStaticModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'success') bool success,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'doc') Map<String, dynamic> docs});
}

/// @nodoc
class __$$SurveyStaticModelImplCopyWithImpl<$Res>
    extends _$SurveyStaticModelCopyWithImpl<$Res, _$SurveyStaticModelImpl>
    implements _$$SurveyStaticModelImplCopyWith<$Res> {
  __$$SurveyStaticModelImplCopyWithImpl(_$SurveyStaticModelImpl _value,
      $Res Function(_$SurveyStaticModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SurveyStaticModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? docs = null,
  }) {
    return _then(_$SurveyStaticModelImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      docs: null == docs
          ? _value._docs
          : docs // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SurveyStaticModelImpl implements _SurveyStaticModel {
  _$SurveyStaticModelImpl(
      {@JsonKey(name: 'success') this.success = false,
      @JsonKey(name: 'message') this.message = '',
      @JsonKey(name: 'doc') final Map<String, dynamic> docs = const {}})
      : _docs = docs;

  factory _$SurveyStaticModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SurveyStaticModelImplFromJson(json);

  @override
  @JsonKey(name: 'success')
  final bool success;
  @override
  @JsonKey(name: 'message')
  final String message;
  final Map<String, dynamic> _docs;
  @override
  @JsonKey(name: 'doc')
  Map<String, dynamic> get docs {
    if (_docs is EqualUnmodifiableMapView) return _docs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_docs);
  }

  @override
  String toString() {
    return 'SurveyStaticModel(success: $success, message: $message, docs: $docs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SurveyStaticModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._docs, _docs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message,
      const DeepCollectionEquality().hash(_docs));

  /// Create a copy of SurveyStaticModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SurveyStaticModelImplCopyWith<_$SurveyStaticModelImpl> get copyWith =>
      __$$SurveyStaticModelImplCopyWithImpl<_$SurveyStaticModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SurveyStaticModelImplToJson(
      this,
    );
  }
}

abstract class _SurveyStaticModel implements SurveyStaticModel {
  factory _SurveyStaticModel(
          {@JsonKey(name: 'success') final bool success,
          @JsonKey(name: 'message') final String message,
          @JsonKey(name: 'doc') final Map<String, dynamic> docs}) =
      _$SurveyStaticModelImpl;

  factory _SurveyStaticModel.fromJson(Map<String, dynamic> json) =
      _$SurveyStaticModelImpl.fromJson;

  @override
  @JsonKey(name: 'success')
  bool get success;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'doc')
  Map<String, dynamic> get docs;

  /// Create a copy of SurveyStaticModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SurveyStaticModelImplCopyWith<_$SurveyStaticModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
