import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  @JsonKey(name: "userId")
  final String? userId;
  @JsonKey(name: "userName")
  final String? userName;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "jwt")
  String? jwt;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "contact")
  final String? contact;


  UserModel( {required this.userName,this.userId, required this.password, required this.firstName, required this.lastName, required this.contact, this.jwt});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}