import 'package:flutter/material.dart';
import 'package:library_management_system/utilities/user_helper.dart';

class LoginPageViewModel extends ChangeNotifier{
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<bool> login() async {
    String userNameText = userName.text.trim();
    String passwordText = password.text.trim();
    
   return await UserHelper().login(userNameText, passwordText);
  }
}