import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_demo_app/app/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:login_demo_app/app/bloc/authentication_bloc/authentication_event.dart';
import 'package:login_demo_app/app/bloc/user_data_bloc/user_data_bloc.dart';
import 'package:login_demo_app/app/bloc/user_data_bloc/user_data_event.dart';
import 'package:login_demo_app/app/bloc/user_data_bloc/user_data_state.dart';
import 'package:login_demo_app/app/pages/home/screen_states/loading_data_error.dart';
import 'package:login_demo_app/app/pages/home/screen_states/loading_data_indicator.dart';
import 'package:login_demo_app/app/global/globals.dart' as globals;

part "home_tab_bar_view.dart";
part "widgets/app_bar.dart";
part "widgets/log_out_button.dart";

class HomePage extends StatelessWidget {
  final List<Tab> tabs = [
    Tab(text: 'On hold'),
    Tab(text: 'In progress'),
    Tab(text: 'Needs review'),
    Tab(text: 'Approved'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(
        builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context)!;
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              BlocProvider.of<UserDataBloc>(context)
                  .add(GetDataEvent(tabController.index));
            }
          });
          return Scaffold(
            appBar: HomeAppBar(tabs),
            body: HomeTabBarView(tabs.length),
          );
        },
      ),
    );
  }
}
