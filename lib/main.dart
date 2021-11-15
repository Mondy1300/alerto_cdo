import 'dart:ui';

import 'package:alerto_cdo_v1/model/user.dart';
import 'package:alerto_cdo_v1/screens/admin/admin_home.dart';
import 'package:alerto_cdo_v1/screens/users/home.dart';
import 'package:alerto_cdo_v1/screens/users/infographics/infographic.dart';
import 'package:alerto_cdo_v1/screens/register.dart';
import 'package:alerto_cdo_v1/screens/login_signup.dart';
import 'package:alerto_cdo_v1/screens/users/report_emergency.dart';
import 'package:alerto_cdo_v1/screens/signup.dart';
import 'package:alerto_cdo_v1/screens/wrapper.dart';
import 'package:alerto_cdo_v1/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users?>.value(
        catchError: (_, __) => null,
        initialData: null,
        value: AuthService().user,
        child: MaterialApp(
          title: 'Alerto CDO',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          initialRoute: '/wrapper',
          routes: {
            '/': (context) => Login_Signup(),
            '/wrapper': (context) => Wrapper(),
            '/signup': (context) => SignUpFormScreen(),
            '/register': (context) => RegisterScreen(),
            '/home': (context) => HomeScreen(),
            '/infographic': (context) => InfographicScreen(),
            '/report_emer': (context) => ReportEmergency(),
            '/admin_home': (context) => AdminHomeScreen(),
          },
        ));
    // );
  }
}
