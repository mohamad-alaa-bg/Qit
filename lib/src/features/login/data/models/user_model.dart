import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@Freezed()
class UserModel with _$UserModel {
  // const UserModel._();
   const factory UserModel({
      @JsonKey(name: 'Id') required final  int id,
      @JsonKey(name: 'Email') required final String email,
      @JsonKey(name: 'Name')required final String name,
      @JsonKey(name: 'Token')required final String token,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
