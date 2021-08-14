import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_demo_app/app/bloc/user_data_bloc/user_data_bloc.dart';
import 'package:login_demo_app/app/bloc/user_data_bloc/user_data_event.dart';
import 'package:login_demo_app/app/global/globals.dart' as globals;
part "../widgets/update_button.dart";

class LoadingDataError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              color: Theme.of(context).accentColor,
              size: 50,
            ),
            SizedBox(height: 15),
            Text('Loading data error!'),
            SizedBox(height: 20),
            UpdateButton(),
          ],
        ),
      ),
    );
  }
}
