import 'package:alerto_cdo_v1/screens/users/infographics/car_crash.dart';
import 'package:alerto_cdo_v1/screens/users/infographics/drowning.dart';
import 'package:alerto_cdo_v1/screens/users/infographics/earthquake.dart';
import 'package:alerto_cdo_v1/screens/users/infographics/fire.dart';
import 'package:alerto_cdo_v1/screens/users/infographics/flood.dart';
import 'package:alerto_cdo_v1/screens/users/infographics/hurricane.dart';
import 'package:alerto_cdo_v1/screens/users/infographics/landslide.dart';
import 'package:alerto_cdo_v1/screens/users/infographics/tornado.dart';
import 'package:alerto_cdo_v1/screens/users/report_emergency.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class InfographicScreen extends StatelessWidget {
  const InfographicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 55),
              child: Text(
                'INFOGRAPHICS',
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 55),
                child: Image.asset(
                  'assets/logo3.png',
                  fit: BoxFit.contain,
                  height: 50,
                ),
              ),
            )
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: Infographic(),
    );
  }
}

class Infographic extends StatefulWidget {
  const Infographic({Key? key}) : super(key: key);

  @override
  _InfographicState createState() => _InfographicState();
}

class _InfographicState extends State<Infographic> {
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
                      autoPlayAnimationDuration: Duration(milliseconds: 1000),
                      viewportFraction: 0.8,
                      aspectRatio: 16 / 9,
                      enlargeCenterPage: true,
                    ),
                  ),
                  width: 400,
                  height: 200,
                )),
            first_row(context),
            second_row(context),
            third_row(context),
            fourth_row(context),
            emergency(context),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            bottomButtons(context),
          ],
        ),
      ]),
    );
  }
}

Widget first_row(BuildContext context) => Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        flood(context),
        fire(context),
      ],
    ));

Widget second_row(BuildContext context) => Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        tornado(context),
        hurricane(context),
      ],
    ));

Widget third_row(BuildContext context) => Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        car_crash(context),
        landslide(context),
      ],
    ));

Widget fourth_row(BuildContext context) => Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        drowning(context),
        earthquake(context),
      ],
    ));

Widget flood(BuildContext context) => Container(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 0, 5),
      child: SizedBox(
        width: 180,
        height: 110,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new FloodInfoScreen()));
          },
          child: Image(
            image: AssetImage("assets/buttons/flood.png"),
          ),
        ),
      ),
    ));

Widget fire(BuildContext context) => Container(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 5, 5),
      child: SizedBox(
          width: 180,
          height: 110,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new FireInfoScreen()));
            },
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new FireInfoScreen()));
              },
              child: Image(
                image: AssetImage("assets/buttons/fire.png"),
              ),
            ),
          )),
    ));

Widget tornado(BuildContext context) => Container(
    child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 10, 0, 5),
        child: SizedBox(
          width: 180,
          height: 110,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => TornadoInfoScreen()));
            },
            child: Image(
              image: AssetImage("assets/buttons/tornado.png"),
            ),
          ),
        )));

Widget hurricane(BuildContext context) => Container(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 5, 5),
      child: SizedBox(
          width: 180,
          height: 110,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => HurricaneInfoScreen()));
            },
            child: Image(
              image: AssetImage("assets/buttons/hurricane.png"),
            ),
          )),
    ));

Widget car_crash(BuildContext context) => Container(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
      child: SizedBox(
          width: 180,
          height: 110,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => CarCrashInfoScreen()));
            },
            child: Image(
              image: AssetImage("assets/buttons/car crash.png"),
            ),
          )),
    ));

Widget landslide(BuildContext context) => Container(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 5, 5),
      child: SizedBox(
          width: 180,
          height: 110,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => LandslideInfoScreen()));
            },
            child: Image(
              image: AssetImage("assets/buttons/landslide.png"),
            ),
          )),
    ));

Widget drowning(BuildContext context) => Container(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 0, 35),
      child: SizedBox(
          width: 180,
          height: 110,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => DrowningInfoScreen()));
            },
            child: Image(
              image: AssetImage("assets/buttons/drowning.png"),
            ),
          )),
    ));

Widget earthquake(BuildContext context) => Container(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 5, 35),
      child: SizedBox(
          width: 180,
          height: 110,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => EarthquakeInfoScreen()));
            },
            child: Image(
              image: AssetImage("assets/buttons/earthquake.png"),
            ),
          )),
    ));

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
          onPressed: () {
            _callNumber();
          },
          icon: Icon(Icons.call),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xff828282)),
          ),
        ),
      ),
    );
_callNumber() async {
  const number = '09553884668';
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);
}

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
