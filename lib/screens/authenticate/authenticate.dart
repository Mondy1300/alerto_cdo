import 'package:alerto_cdo_v1/screens/login_signup.dart';
import 'package:alerto_cdo_v1/screens/users/home.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: HomeScreen(),
    );
  }
}
