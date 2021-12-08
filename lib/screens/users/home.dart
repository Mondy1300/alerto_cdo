import 'package:alerto_cdo_v1/google_login_controller.dart';
import 'package:alerto_cdo_v1/loading.dart';
import 'package:alerto_cdo_v1/screens/about_us.dart';
import 'package:alerto_cdo_v1/screens/admin/admin_home.dart';
import 'package:alerto_cdo_v1/screens/help.dart';
import 'package:alerto_cdo_v1/screens/users/accountinfo.dart';
import 'package:alerto_cdo_v1/screens/users/announce_list_user.dart';
import 'package:alerto_cdo_v1/screens/users/infographics/infographic.dart';
import 'package:alerto_cdo_v1/screens/users/my_reports.dart';
import 'package:alerto_cdo_v1/screens/users/report_emergency.dart';
import 'package:alerto_cdo_v1/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(LoginController());

  final _auth = AuthService();
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
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new AdminHomeScreen()));
                  },
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
                  children: [CircleAvatar()],
                )),
            ListTile(
              title: Text('Update Profile'),
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
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new HelpScreen()));
              },
            ),
            ListTile(
                title: Text('Logout'),
                onTap: () async {
                  // print(controller.getName());
                  await _auth.signOut();
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

  String? myuser;

  String token = '';
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    getToken();

    // onMessage: When the app is open and it receives a push notification
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("onMessage data: ${message.data}");
    });

    // replacement for onResume: When the app is in the background and opened directly from the push notification.
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('onMessageOpenedApp data: ${message.data}');
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new MyReportsScreen()));
    });

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   print('A new onMessageOpenedApp event was published!');
    // });

    // firebaseMessaging.configure(
    //   onMessage: (Map<String, dynamic> message) async {
    //     print("onMessage: $message");
    //     //_showItemDialog(message);
    //   },
    //   //onBackgroundMessage: myBackgroundMessageHandler,
    //   onLaunch: (Map<String, dynamic> message) async {
    //     print("onLaunch: $message");
    //     //_navigateToItemDetail(message);
    //   },
    //   onResume: (Map<String, dynamic> message) async {
    //     print("onResume: $message");
    //     //_navigateToItemDetail(message);
    //   },
    // );
    check();
    super.initState();
  }

  void getToken() async {
    token = (await firebaseMessaging.getToken())!;
  }

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
                color: Color(0xffBA0F30),
                child: SizedBox(
                  width: 400,
                  height: 200,
                  child: CarouselSlider(
                    items: [
                      Image(
                          image: AssetImage("assets/sliders/1.png"),
                          fit: BoxFit.cover),
                      Image(
                          image: AssetImage("assets/sliders/2.jpg"),
                          fit: BoxFit.cover),
                      Image(
                          image: AssetImage("assets/sliders/3.jpg"),
                          fit: BoxFit.cover),
                      Image(
                          image: AssetImage("assets/sliders/4.png"),
                          fit: BoxFit.cover),
                      Image(
                          image: AssetImage("assets/sliders/5.jpg"),
                          fit: BoxFit.cover),
                      Image(
                          image: AssetImage("assets/sliders/6.jpg"),
                          fit: BoxFit.cover),
                      Image(
                          image: AssetImage("assets/sliders/7.png"),
                          fit: BoxFit.cover),
                      Image(
                          image: AssetImage("assets/sliders/8.jpg"),
                          fit: BoxFit.cover),
                      Image(
                          image: AssetImage("assets/sliders/9.jpg"),
                          fit: BoxFit.cover),
                    ],
                    options: CarouselOptions(
                      height: 190,
                      autoPlay: true,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 1500),
                      viewportFraction: 0.8,
                      aspectRatio: 16 / 9,
                      enlargeCenterPage: true,
                    ),
                  ),
                )),
            (myuser == '') ? updateuserinfo() : SizedBox(),
            info(context),
            profile(context),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 70, bottom: 10),
              child: Text(
                "ANNOUNCEMENTS",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
            ),
            announcements(),
            SizedBox(
              height: 100,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color: Colors.black,
              child: SizedBox(
                height: 70,
                width: double.infinity,
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

  void check() async {
    var collection = FirebaseFirestore.instance.collection('alerto_users');
    FirebaseAuth auths = FirebaseAuth.instance;
    final String userid = auths.currentUser!.uid;
    DocumentSnapshot docSnap = await collection.doc(userid).get();

    setState(() {
      myuser = docSnap.get('firstname');
    });
  }

  Widget updateuserinfo() => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            width: 200,
            height: 100,
            color: Colors.black,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Update your profile first",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new AccountInfoScreen()));
                      },
                      child: Text("Click Here"))
                ],
              ),
            )),
      );

  Widget info(BuildContext context) => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 35, 5, 0),
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
                  width: 180,
                  height: 100,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 35, 5, 0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => MyReportsScreen()));
                },
                child: SizedBox(
                  width: 180,
                  height: 100,
                  child: Image(
                    image: AssetImage("assets/buttons/userviewreports.png"),
                  ),
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

Widget profile(context) => Container(
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
                        builder: (context) => new AccountInfoScreen()));
              },
              child: SizedBox(
                width: 180,
                height: 100,
                child: Image(
                  image: AssetImage("assets/buttons/profile.png"),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new AboutUsScreen()));
              },
              child: SizedBox(
                width: 180,
                height: 100,
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
      color: const Color(0xFF0000).withOpacity(0.3),
      width: 400,
      height: 400,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnnouncelistUser(),
      ),
    );

Widget bottomButtons(BuildContext context) => Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 7),
            child: emergency(context),
          ),
        ],
      ),
    );

Widget call_now() {
  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: SizedBox(
      width: 160,
      height: 50,
      child: OutlinedButton.icon(
        label: Text(
          'CALL NOW?',
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () async {
          // launch('tel:09551161502');
          _callNumber();
        },
        icon: Icon(Icons.call),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xff828282)),
        ),
      ),
    ),
  );
}

_callNumber() async {
  const number = '09553884668';
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);
}

Widget emergency(context) => Padding(
      padding: const EdgeInsets.all(2),
      child: Center(
        child: SizedBox(
          width: 360,
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
      ),
    );
