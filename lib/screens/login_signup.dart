import 'dart:ui';

import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          )),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 100),
                child: Image(image: AssetImage('assets/logo.png')),
              ),
              btnLogin(context),
              btnRegister(context),
            ],
          )),
    );
  }
}

Widget btnLogin(BuildContext context) => Container(
    margin: EdgeInsets.only(top: 50),
    child: SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('LOG IN', style: TextStyle(fontSize: 20)),
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
          Navigator.pushNamed(context, '/signup');
        },
        child: Text('REGISTER', style: TextStyle(fontSize: 20)),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
        ),
      ),
    ));
