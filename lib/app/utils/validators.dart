extension Validators on String {
  bool isValidUsername(String username) {
    return username.length >= 4;
  }

  bool isValidPassword(String password) {
    return password.length >= 8;
  }
}
