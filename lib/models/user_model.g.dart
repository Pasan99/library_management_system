// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    userName: json['userId'] as String,
    password: json['password'] as String?,
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    contact: json['contact'] as String,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userId': instance.userName,
      'password': instance.password,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'contact': instance.contact,
    };
