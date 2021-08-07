import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_demo_app/app/bloc/user_data_bloc.dart/user_data_bloc.dart';
import 'package:login_demo_app/app/bloc/user_data_bloc.dart/user_data_event.dart';

class LoadingDataError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline_rounded,
                color: Theme.of(context).accentColor, size: 50),
            SizedBox(height: 15),
            Text('Loading data error!'),
            SizedBox(height: 20),
            _updateButton(context),
          ],
        ),
      ),
    );
  }

  Widget _updateButton(context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(20)),
      child: TextButton(
        onPressed: () {
          BlocProvider.of<UserDataBloc>(context).add(GetDataEvent());
        },
        child: Text('Update', style: TextStyle(color: Colors.teal)),
      ),
    );
  }
}
