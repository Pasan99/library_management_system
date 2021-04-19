// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseModel _$ResponseModelFromJson(Map<String, dynamic> json) {
  return ResponseModel(
    responseCode: json['responseCode'] as String,
    responseMessage: json['responseMessage'] as String,
    responseData: json['responseData'],
  );
}

Map<String, dynamic> _$ResponseModelToJson(ResponseModel instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'responseMessage': instance.responseMessage,
      'responseData': instance.responseData,
    };
