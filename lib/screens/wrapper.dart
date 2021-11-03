import 'package:alerto_cdo_v1/model/user.dart';
import 'package:alerto_cdo_v1/screens/authenticate/authenticate.dart';
import 'package:alerto_cdo_v1/screens/users/home.dart';
import 'package:alerto_cdo_v1/screens/login_signup.dart';
import 'package:alerto_cdo_v1/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userInstance = Provider.of<Users?>(context);
    print(userInstance!.uid);

    if (userInstance == null) {
      // print(userInstance);
      return Login_Signup();
    } else {
      print('wew');
      return HomeScreen();
    }
  }
}
