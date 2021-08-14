import 'package:flutter/material.dart';

class SampleTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isValid;
  final String? errorMessage;
  final bool obscure;

  SampleTextField(
    this.controller,
    this.isValid,
    this.errorMessage,
    this.obscure,
  );

  @override
  Widget build(BuildContext context) {
    final String hintUsernameText = 'Enter your username';
    final String hintPasswordText = 'Enter your password';
    final double borderRadius = MediaQuery.of(context).size.height * 0.5;
    return TextField(
      obscureText: obscure,
      controller: controller,
      textAlign: TextAlign.center,
      cursorColor: Theme.of(context).accentColor,
      decoration: InputDecoration(
        errorText: !isValid ? errorMessage : null,
        hintText: obscure ? hintPasswordText : hintUsernameText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: 2,
            color: isValid ? Theme.of(context).accentColor : Colors.red,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
