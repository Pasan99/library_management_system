import 'package:json_annotation/json_annotation.dart';
part 'response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseModel {
  @JsonKey(name: "responseCode")
  final String responseCode;
  @JsonKey(name: "responseMessage")
  final String responseMessage;
  @JsonKey(name: "responseData")
  final dynamic responseData;

  ResponseModel({required this.responseCode, required this.responseMessage, required this.responseData});

  factory ResponseModel.fromJson(Map<String, dynamic> json) => _$ResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}