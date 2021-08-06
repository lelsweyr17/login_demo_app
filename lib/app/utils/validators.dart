class Validators {
  static isValidUsername(String username) {
    return username.length >= 4;
  }

  static isValidPassword(String password) {
    return password.length >= 8;
  }
}
