import 'package:alerto_cdo_v1/google_login_controller.dart';
import 'package:alerto_cdo_v1/loading.dart';
import 'package:alerto_cdo_v1/my_icons_icons.dart';
import 'package:alerto_cdo_v1/screens/admin/admin_home.dart';
import 'package:alerto_cdo_v1/screens/users/accountinfo.dart';
import 'package:alerto_cdo_v1/screens/users/infographics/infographic.dart';
import 'package:alerto_cdo_v1/screens/login.dart';
import 'package:alerto_cdo_v1/screens/users/report_emergency.dart';
import 'package:alerto_cdo_v1/screens/signup.dart';
import 'package:alerto_cdo_v1/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(LoginController());

  // final auth = AuthService();
  // var _googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 65),
              child: Text(
                'DASHBOARD',
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 70),
                child: InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/logo3.png',
                    fit: BoxFit.contain,
                    height: 50,
                  ),
                ),
              ),
            )
          ],
        ),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                        // backgroundImage:
                        //     Image.network(googleAccount.value?.photoUrl ?? '')
                        //         .image,
                        // radius: 80,
                        )
                  ],
                )),
            ListTile(
              title: Text('Update Profile'
                  // googleAccount.value?.displayName ?? '',
                  // style: Get.textTheme.headline3,
                  ),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new AccountInfoScreen()));
              },
            ),
            ListTile(
              title: Text('Help'
                  // googleAccount.value?.email ?? '',
                  // style: Get.textTheme.bodyText1,
                  ),
              onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Loading()));
              },
            ),
            ListTile(
                title: Text('Logout'),
                onTap: () {
                  // print(controller.getName());
                })
          ],
        ),
      ),
      body: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/bg.jpg"))),
              margin: EdgeInsets.all(0),
              // color: Color(0xff900d0d),
              child: SizedBox(
                width: 400,
                height: 200,
              )),
          first_row(context),
          second_row(context),
          call_now(),
          emergency(context),
        ],
      ),
    );
  }

  Widget first_row(BuildContext context) => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
              child: SizedBox(
                width: 160,
                height: 80,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
              child: SizedBox(
                width: 160,
                height: 80,
                child: OutlinedButton.icon(
                  label: Text(
                    'Covid-19',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () async {
                    // GoogleSignIn().signOut();
                    await _auth.signOut;

                    Navigator.pop(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new LoginScreen()));
                  },
                  icon: Icon(
                    Icons.menu_open_outlined,
                    color: Colors.white,
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xffBA0F30)),
                  ),
                ),
              ),
            )
          ],
        ),
      );
}

Widget second_row(context) => Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: SizedBox(
              width: 160,
              height: 80,
              child: OutlinedButton.icon(
                label: Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {},
                icon: Icon(
                  Icons.account_box_sharp,
                  color: Colors.white,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xffBA0F30)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: SizedBox(
              width: 160,
              height: 80,
              child: OutlinedButton.icon(
                label: Text(
                  'About us',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new AdminHomeScreen()));
                },
                icon: Icon(
                  Icons.info,
                  color: Colors.white,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xffBA0F30)),
                ),
              ),
            ),
          )
        ],
      ),
    );

Widget call_now() => Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        width: 360,
        height: 60,
        child: OutlinedButton.icon(
          label: Text(
            'CALL NOW?',
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {},
          icon: Icon(Icons.call),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xff828282)),
          ),
        ),
      ),
    );

Widget emergency(context) => Padding(
      padding: const EdgeInsets.fromLTRB(2, 180, 2, 2),
      child: SizedBox(
        width: 360,
        height: 60,
        child: OutlinedButton.icon(
          label: Text(
            'EMERGENCY',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new ReportEmergency()));
          },
          icon: Icon(
            Icons.warning,
            color: Colors.white,
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xffFF0000)),
          ),
        ),
      ),
    );
