extension Validators on String {
  bool isValidUsername() {
    return this.length >= 4;
  }

  bool isValidPassword() {
    return this.length >= 8;
  }
}
