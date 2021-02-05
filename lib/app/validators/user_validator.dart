import 'package:flutter/material.dart';

class UserValidatorMixin {
  BuildContext context;

  String validateUserName(String userName) {
    userName = userName.trim();
    if (userName.isEmpty) {
      return "Username can't be empty";
    } else {
      return null;
    }
  }
}
