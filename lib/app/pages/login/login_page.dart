import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_demo_app/app/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:login_demo_app/app/bloc/authentication_bloc/authentication_event.dart';
import 'package:login_demo_app/app/bloc/login_bloc/login_bloc.dart';
import 'package:login_demo_app/app/bloc/login_bloc/login_event.dart';
import 'package:login_demo_app/app/bloc/login_bloc/login_state.dart';
import 'package:login_demo_app/app/pages/login/widgets/log_in_button.dart';
import 'package:login_demo_app/app/pages/login/widgets/sample_text_field.dart';
part "login_form.dart";

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
