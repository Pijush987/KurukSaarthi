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
  @JsonKey(name: 'partyPlus')
  int get partyPlus => throw _privateConstructorUsedError;
  @JsonKey(name: 'partyMinus')
  int get partyMinus => throw _privateConstructorUsedError;
  @JsonKey(name: 'neutral')
  int get neutral => throw _privateConstructorUsedError;
  @JsonKey(name: 'dead')
  int get dead => throw _privateConstructorUsedError;
  @JsonKey(name: 'count')
  int get count => throw _privateConstructorUsedError;
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
      @JsonKey(name: 'partyPlus') int partyPlus,
      @JsonKey(name: 'partyMinus') int partyMinus,
      @JsonKey(name: 'neutral') int neutral,
      @JsonKey(name: 'dead') int dead,
      @JsonKey(name: 'count') int count,
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
    Object? partyPlus = null,
    Object? partyMinus = null,
    Object? neutral = null,
    Object? dead = null,
    Object? count = null,
    Object? inchargeName = null,
  }) {
    return _then(_value.copyWith(
      voterNo: null == voterNo
          ? _value.voterNo
          : voterNo // ignore: cast_nullable_to_non_nullable
              as String,
      partyPlus: null == partyPlus
          ? _value.partyPlus
          : partyPlus // ignore: cast_nullable_to_non_nullable
              as int,
      partyMinus: null == partyMinus
          ? _value.partyMinus
          : partyMinus // ignore: cast_nullable_to_non_nullable
              as int,
      neutral: null == neutral
          ? _value.neutral
          : neutral // ignore: cast_nullable_to_non_nullable
              as int,
      dead: null == dead
          ? _value.dead
          : dead // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
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
      @JsonKey(name: 'partyPlus') int partyPlus,
      @JsonKey(name: 'partyMinus') int partyMinus,
      @JsonKey(name: 'neutral') int neutral,
      @JsonKey(name: 'dead') int dead,
      @JsonKey(name: 'count') int count,
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
    Object? partyPlus = null,
    Object? partyMinus = null,
    Object? neutral = null,
    Object? dead = null,
    Object? count = null,
    Object? inchargeName = null,
  }) {
    return _then(_$SurveyModelImpl(
      voterNo: null == voterNo
          ? _value.voterNo
          : voterNo // ignore: cast_nullable_to_non_nullable
              as String,
      partyPlus: null == partyPlus
          ? _value.partyPlus
          : partyPlus // ignore: cast_nullable_to_non_nullable
              as int,
      partyMinus: null == partyMinus
          ? _value.partyMinus
          : partyMinus // ignore: cast_nullable_to_non_nullable
              as int,
      neutral: null == neutral
          ? _value.neutral
          : neutral // ignore: cast_nullable_to_non_nullable
              as int,
      dead: null == dead
          ? _value.dead
          : dead // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
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
      @JsonKey(name: 'partyPlus') this.partyPlus = 0,
      @JsonKey(name: 'partyMinus') this.partyMinus = 0,
      @JsonKey(name: 'neutral') this.neutral = 0,
      @JsonKey(name: 'dead') this.dead = 0,
      @JsonKey(name: 'count') this.count = 0,
      @JsonKey(name: 'inchargeName') this.inchargeName = ''});

  factory _$SurveyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SurveyModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String voterNo;
  @override
  @JsonKey(name: 'partyPlus')
  final int partyPlus;
  @override
  @JsonKey(name: 'partyMinus')
  final int partyMinus;
  @override
  @JsonKey(name: 'neutral')
  final int neutral;
  @override
  @JsonKey(name: 'dead')
  final int dead;
  @override
  @JsonKey(name: 'count')
  final int count;
  @override
  @JsonKey(name: 'inchargeName')
  final String inchargeName;

  @override
  String toString() {
    return 'SurveyModel(voterNo: $voterNo, partyPlus: $partyPlus, partyMinus: $partyMinus, neutral: $neutral, dead: $dead, count: $count, inchargeName: $inchargeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SurveyModelImpl &&
            (identical(other.voterNo, voterNo) || other.voterNo == voterNo) &&
            (identical(other.partyPlus, partyPlus) ||
                other.partyPlus == partyPlus) &&
            (identical(other.partyMinus, partyMinus) ||
                other.partyMinus == partyMinus) &&
            (identical(other.neutral, neutral) || other.neutral == neutral) &&
            (identical(other.dead, dead) || other.dead == dead) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.inchargeName, inchargeName) ||
                other.inchargeName == inchargeName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, voterNo, partyPlus, partyMinus,
      neutral, dead, count, inchargeName);

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
          @JsonKey(name: 'partyPlus') final int partyPlus,
          @JsonKey(name: 'partyMinus') final int partyMinus,
          @JsonKey(name: 'neutral') final int neutral,
          @JsonKey(name: 'dead') final int dead,
          @JsonKey(name: 'count') final int count,
          @JsonKey(name: 'inchargeName') final String inchargeName}) =
      _$SurveyModelImpl;

  factory _SurveyModel.fromJson(Map<String, dynamic> json) =
      _$SurveyModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get voterNo;
  @override
  @JsonKey(name: 'partyPlus')
  int get partyPlus;
  @override
  @JsonKey(name: 'partyMinus')
  int get partyMinus;
  @override
  @JsonKey(name: 'neutral')
  int get neutral;
  @override
  @JsonKey(name: 'dead')
  int get dead;
  @override
  @JsonKey(name: 'count')
  int get count;
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
