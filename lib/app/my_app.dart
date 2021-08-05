import 'package:flutter/material.dart';
import 'package:login_demo_app/app/pages/home_page.dart';
import 'package:login_demo_app/app/pages/login_page.dart';
import 'package:login_demo_app/app/theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Themes.mainTheme(),
      initialRoute: '/',
      routes: appRoutes,
    );
  }

  final Map<String, WidgetBuilder> appRoutes = {
    '/': (context) => LoginPage(),
    '/home' : (context) => HomePage(),
  };
}
