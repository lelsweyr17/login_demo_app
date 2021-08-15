extension Validators on String {
  bool isValidUsername() => this.length >= 4;
  bool isValidPassword() => this.length >= 8;
}
