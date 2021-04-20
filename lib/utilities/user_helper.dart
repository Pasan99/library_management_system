import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:library_management_system/models/constants.dart';
import 'package:library_management_system/models/response_model.dart';
import 'package:library_management_system/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class UserHelper {
  static final UserHelper _userHelper = UserHelper._internal();
  UserModel? _user;
  UserModel? _oldUser;

  factory UserHelper() {
    return _userHelper;
  }

  UserHelper._internal();

  Future<UserModel?> getCurrentUser() async {
    if (_user != null) {
      return _user;
    } else {
      try {
        // get user
        SharedPreferences preferences = await SharedPreferences.getInstance();
        _user = UserModel.fromJson(jsonDecode(preferences.getString("current_user").toString()) as Map<String, dynamic>);

      } catch (Exception) {
        print(Exception.toString());
        return null;
      }
    }
    _oldUser = _user;
    return _user;
  }

  UserModel? getCachedUser() {
    return _oldUser;
  }

  Future<bool> login(String userName, String password) async {
    try {
      String url1 = AppConstants.BASE_URL + AppConstants.LOGIN_PATH + "?password=$password&userId=$userName";
      var url = Uri.parse(url1);
      http.Response response = await http.get(url);
      print(response.body);
      var code = ResponseModel.fromJson(jsonDecode(response.body)).responseCode;
      if (code == "SUCCESS"){
        var userModel = ResponseModel.fromJson(jsonDecode(response.body)).responseData;
        _user = UserModel.fromJson(userModel);
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString("current_user", jsonEncode(_user));
        return true;
      }
      else{
        return false;
      }
    }
    catch(e){
      print(e);
      return false;
    }
  }

  Future<bool> register(UserModel user) async {
    try {
      String url1 = AppConstants.BASE_URL + AppConstants.REGISTER_PATH;
      var url = Uri.parse(url1);
      print(jsonEncode(user));
      http.Response response = await http.post(url, headers: {"Content-Type": "application/json"}, body: jsonEncode(user));
      print(response.body);
      var code = ResponseModel.fromJson(jsonDecode(response.body)).responseCode;
      if (code == "SUCCESS"){
        await login(user.userName, user.password!);
        return true;
      }
      else{
        return false;
      }
    }
    catch(e){
      print(e);
      return false;
    }
  }

  logout() async {
    _user = null;
    _oldUser = null;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("current_user", "");
    await getCurrentUser();
  }

  Future<UserModel?> renewUser() async {
    _user = null;
    return await getCurrentUser();
  }

  updateUser(UserModel user) async {

  }
}
