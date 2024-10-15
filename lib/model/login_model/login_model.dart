import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_model.freezed.dart';
part 'login_model.g.dart';
@freezed
class LoginModel with _$LoginModel {
  factory LoginModel({
    @Default(false) bool success,
    @Default('') String token,
    @Default('') String message,
    @Default('') String code,

}) = _LoginModel;

  factory LoginModel.fromJson(Map<String,dynamic> json) => _$LoginModelFromJson(json);
}