import 'dart:ui';

import 'package:alerto_cdo_v1/screens/login.dart';
import 'package:alerto_cdo_v1/screens/register.dart';
import 'package:alerto_cdo_v1/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../google_login_controller.dart';
import 'users/home.dart';

void main() {
  runApp(Login_Signup());
}

class Login_Signup extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alerto CDO',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'ALERTO CDO'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          )),
          child: ListView(children: [
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 100),
                  child: Image(image: AssetImage('assets/logo.png')),
                ),
                // Obx(() {
                //   if (controller.googleAccount.value == null)
                //     return Login_Signup();
                //   else
                //     return
                // }),
                btnLogin(context),
                btnRegister(context),
                btnEmail(context)
              ],
            ),
          ])),
    );
  }
}

Widget btnLogin(BuildContext context) => Container(
    margin: EdgeInsets.only(top: 50),
    child: SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => new RegisterScreen()));
        },
        child: Text('REGISTER', style: TextStyle(fontSize: 20)),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
        ),
      ),
    ));

Widget btnRegister(BuildContext context) => Container(
    margin: EdgeInsets.only(top: 20),
    child: SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new LoginScreen()));
        },
        child: Text('SIGN IN', style: TextStyle(fontSize: 20)),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
        ),
      ),
    ));

Widget btnEmail(BuildContext context) => Container(
    margin: EdgeInsets.only(top: 20),
    child: FloatingActionButton.extended(
      onPressed: () {
        GoogleSignIn().signIn();

        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new HomeScreen()));
      },
      icon: Image.asset(
        'assets/google_logo.png',
        height: 32,
        width: 32,
      ),
      label: Text(
        'Sign in with Google',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
    ));
