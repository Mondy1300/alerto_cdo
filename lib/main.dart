import 'dart:ui';

import 'package:alerto_cdo_v1/screens/home.dart';
import 'package:alerto_cdo_v1/screens/infographic.dart';
import 'package:alerto_cdo_v1/screens/login.dart';
import 'package:alerto_cdo_v1/screens/login_signup.dart';
import 'package:alerto_cdo_v1/screens/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alerto CDO',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/infographic',
      routes: {
        '/': (context) => Login_Signup(),
        '/signup': (context) => SignUpFormScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/infographic': (context) => InfographicScreen(),
      },
    );
  }
}
