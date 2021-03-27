class UserValidatorMixin {

  String? validateUserName(String userName) {
    userName = userName.trim();
    if (userName.isEmpty) {
      return "Username can't be empty";
    } else {
      return null;
    }
  }
}
