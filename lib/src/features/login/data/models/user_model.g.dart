// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['Id'] as int,
      email: json['Email'] as String,
      name: json['Name'] as String,
      token: json['Token'] as String,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Email': instance.email,
      'Name': instance.name,
      'Token': instance.token,
    };
