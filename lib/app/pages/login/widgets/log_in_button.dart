import 'package:flutter/material.dart';
import 'package:login_demo_app/app/bloc/login_bloc/login_bloc.dart';
import 'package:login_demo_app/app/bloc/login_bloc/login_event.dart';
import 'package:login_demo_app/app/bloc/login_bloc/login_state.dart';

class LogInButton extends StatelessWidget {
  final BuildContext context;
  final LoginState state;
  final LoginBloc _loginBloc;
  final TextEditingController _usernameController;
  final TextEditingController _passwordController;

  LogInButton(
    this.context,
    this.state,
    this._loginBloc,
    this._usernameController,
    this._passwordController,
  );

  @override
  Widget build(BuildContext context) {
    final double borderRadius = MediaQuery.of(context).size.height * 0.5;
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: Theme.of(context).accentColor,
        ),
        child: TextButton(
          child: Text('Log in',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              )),
          onPressed: () {
            if (isLoginButtonEnabled(state)) {
              _onFormSubmitted();
              _passwordController.text = '';
              _usernameController.text = '';
            }
          },
        ));
  }

  bool get isNotEmpty =>
      _usernameController.text.isNotEmpty &&
      _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) {
    return state.isFormValid && isNotEmpty && !state.isSubmitting;
  }

  void _onFormSubmitted() {
    _loginBloc.add(LoginWithCredentialsPressed(
      _usernameController.text,
      _passwordController.text,
    ));
  }
}
