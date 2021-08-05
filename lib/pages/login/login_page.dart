import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_demo_app/bloc/login_bloc/login_bloc.dart';
import 'package:login_demo_app/pages/login/login_form.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kanban'),
        centerTitle: false,
      ),
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
        child: LoginForm(),
      ),
    );
  }
}
