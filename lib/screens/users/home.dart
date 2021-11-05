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
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/buttons/MAIN BG.png"),
              fit: BoxFit.cover)),
      child: Stack(children: [
        ListView(
          children: [
            Container(
                margin: EdgeInsets.all(0),
                color: Color(0xff900d0d),
                child: SizedBox(
                  width: 400,
                  height: 200,
                )),
            first_row(context),
            second_row(context),
            third_row(context),
            announcements(),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color: Colors.black,
              child: SizedBox(
                height: 70,
                width: 400,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            bottomButtons(context),
          ],
        ),
      ]),
    );
  }

  Widget first_row(BuildContext context) => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new InfographicScreen()));
                },
                child: SizedBox(
                  child: Image(
                    image: AssetImage("assets/buttons/infographics.png"),
                  ),
                  width: 200,
                  height: 120,
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
            //   child: SizedBox(
            //     width: 160,
            //     height: 80,
            //     child: Image(
            //       image: AssetImage("assets/buttons/covid.png"),
            //     ),
            //   ),
            // )
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
            child: InkWell(
              onTap: () {},
              child: SizedBox(
                width: 200,
                height: 120,
                child: Image(
                  image: AssetImage("assets/buttons/profile.png"),
                ),
              ),
            ),
          ),
        ],
      ),
    );

Widget third_row(context) => Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: InkWell(
              onTap: () {},
              child: SizedBox(
                width: 200,
                height: 120,
                child: Image(
                  image: AssetImage("assets/buttons/about us.png"),
                ),
              ),
            ),
          )
        ],
      ),
    );

Widget announcements() => Container(
      width: 400,
      height: 400,
      child: TextField(),
    );

Widget bottomButtons(BuildContext context) => Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10, bottom: 7),
            child: call_now(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 7),
            child: emergency(context),
          ),
        ],
      ),
    );
Widget call_now() => Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        width: 160,
        height: 50,
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
      padding: const EdgeInsets.all(2),
      child: SizedBox(
        width: 160,
        height: 50,
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
