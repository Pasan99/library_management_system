import 'package:flutter/material.dart';
import 'package:library_management_system/models/user_model.dart';
import 'package:library_management_system/utilities/user_helper.dart';

class RegistrationPageViewModel extends ChangeNotifier{
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController contact = TextEditingController();

  Future<bool> register() async {
    String userNameText = userName.text.trim();
    String passwordText = password.text.trim();
    String firstNameText = firstName.text.trim();
    String lastNameText = lastName.text.trim();
    String contactText = contact.text.trim();

    UserModel user = UserModel(userName: userNameText, password: passwordText, firstName: firstNameText, lastName: lastNameText, contact: contactText);
    return await UserHelper().register(user);
  }
}