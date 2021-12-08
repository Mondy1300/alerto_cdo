import 'package:alerto_cdo_v1/model/user.dart';
import 'package:alerto_cdo_v1/screens/admin/admin_home.dart';
import 'package:alerto_cdo_v1/screens/authenticate/authenticate.dart';
import 'package:alerto_cdo_v1/screens/register.dart';
import 'package:alerto_cdo_v1/screens/users/home.dart';
import 'package:alerto_cdo_v1/screens/login_signup.dart';
import 'package:alerto_cdo_v1/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userInstance = Provider.of<Users?>(context);
    FirebaseAuth auth = FirebaseAuth.instance;
    // print(userInstance!.uid);

    // return Authenticate();
    if (userInstance == null) {
      // print(userInstance);
      return Login_Signup();
    } else if (auth.currentUser!.email == 'admin@gmail.com' ||
        auth.currentUser!.email == 'admin2@gmail.com' ||
        auth.currentUser!.email == 'admin3@gmail.com') {
      return AdminHomeScreen();
    } else {
      print('wew');
      return HomeScreen();
    }
  }
}
