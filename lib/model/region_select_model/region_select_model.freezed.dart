// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'region_select_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegionSelectModel _$RegionSelectModelFromJson(Map<String, dynamic> json) {
  return _RegionSelectModel.fromJson(json);
}

/// @nodoc
mixin _$RegionSelectModel {
  String get message => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  /// Serializes this RegionSelectModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegionSelectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegionSelectModelCopyWith<RegionSelectModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionSelectModelCopyWith<$Res> {
  factory $RegionSelectModelCopyWith(
          RegionSelectModel value, $Res Function(RegionSelectModel) then) =
      _$RegionSelectModelCopyWithImpl<$Res, RegionSelectModel>;
  @useResult
  $Res call({String message, String error});
}

/// @nodoc
class _$RegionSelectModelCopyWithImpl<$Res, $Val extends RegionSelectModel>
    implements $RegionSelectModelCopyWith<$Res> {
  _$RegionSelectModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegionSelectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegionSelectModelImplCopyWith<$Res>
    implements $RegionSelectModelCopyWith<$Res> {
  factory _$$RegionSelectModelImplCopyWith(_$RegionSelectModelImpl value,
          $Res Function(_$RegionSelectModelImpl) then) =
      __$$RegionSelectModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String error});
}

/// @nodoc
class __$$RegionSelectModelImplCopyWithImpl<$Res>
    extends _$RegionSelectModelCopyWithImpl<$Res, _$RegionSelectModelImpl>
    implements _$$RegionSelectModelImplCopyWith<$Res> {
  __$$RegionSelectModelImplCopyWithImpl(_$RegionSelectModelImpl _value,
      $Res Function(_$RegionSelectModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegionSelectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? error = null,
  }) {
    return _then(_$RegionSelectModelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegionSelectModelImpl implements _RegionSelectModel {
  _$RegionSelectModelImpl({this.message = '', this.error = ''});

  factory _$RegionSelectModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegionSelectModelImplFromJson(json);

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final String error;

  @override
  String toString() {
    return 'RegionSelectModel(message: $message, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegionSelectModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, error);

  /// Create a copy of RegionSelectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegionSelectModelImplCopyWith<_$RegionSelectModelImpl> get copyWith =>
      __$$RegionSelectModelImplCopyWithImpl<_$RegionSelectModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegionSelectModelImplToJson(
      this,
    );
  }
}

abstract class _RegionSelectModel implements RegionSelectModel {
  factory _RegionSelectModel({final String message, final String error}) =
      _$RegionSelectModelImpl;

  factory _RegionSelectModel.fromJson(Map<String, dynamic> json) =
      _$RegionSelectModelImpl.fromJson;

  @override
  String get message;
  @override
  String get error;

  /// Create a copy of RegionSelectModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegionSelectModelImplCopyWith<_$RegionSelectModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
