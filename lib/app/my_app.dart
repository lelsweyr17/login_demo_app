import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_demo_app/app/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:login_demo_app/app/init_app/app_navigator.dart';
import 'package:login_demo_app/app/init_app/theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Themes.mainTheme(),
      home: BlocProvider(
        create: (context) => AuthenticationBloc(),
        child: AppNavigator(),
      ),
    );
  }
}
