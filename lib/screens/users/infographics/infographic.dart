import 'package:alerto_cdo_v1/screens/users/infographics/earthquake.dart';
import 'package:alerto_cdo_v1/screens/users/infographics/fire.dart';
import 'package:alerto_cdo_v1/screens/users/infographics/flood.dart';
import 'package:alerto_cdo_v1/screens/users/report_emergency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      child: ListView(
        children: [
          Container(
              margin: EdgeInsets.all(0),
              color: Color(0xffBA0F30),
              child: SizedBox(
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
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
      child: SizedBox(
        width: 130,
        height: 80,
        child: TextButton(
            child: Text('Flood',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                )),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new FloodInfoScreen()));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xffBA0F30)),
            )),
      ),
    ));

Widget fire(BuildContext context) => Container(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
      child: SizedBox(
        width: 130,
        height: 80,
        child: TextButton(
            child: Text('Fire',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                )),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new FireInfoScreen()));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xffBA0F30)),
            )),
      ),
    ));

Widget tornado(BuildContext context) => Container(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
      child: SizedBox(
        width: 130,
        height: 80,
        child: TextButton(
            child: Text('Tornado',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                )),
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xffBA0F30)),
            )),
      ),
    ));

Widget hurricane(BuildContext context) => Container(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
      child: SizedBox(
        width: 130,
        height: 80,
        child: TextButton(
            child: Text('Hurricane',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                )),
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xffBA0F30)),
            )),
      ),
    ));

Widget car_crash(BuildContext context) => Container(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
      child: SizedBox(
        width: 130,
        height: 80,
        child: TextButton(
            child: Text('Car Crash',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                )),
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xffBA0F30)),
            )),
      ),
    ));

Widget landslide(BuildContext context) => Container(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
      child: SizedBox(
        width: 130,
        height: 80,
        child: TextButton(
            child: Text('Landslide',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                )),
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xffBA0F30)),
            )),
      ),
    ));

Widget drowning(BuildContext context) => Container(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
      child: SizedBox(
        width: 130,
        height: 80,
        child: TextButton(
            child: Text('Drowning',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                )),
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xffBA0F30)),
            )),
      ),
    ));

Widget earthquake(BuildContext context) => Container(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
      child: SizedBox(
        width: 130,
        height: 80,
        child: TextButton(
            child: Text('Earthquake',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                )),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new EarthquakeInfoScreen()));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xffBA0F30)),
            )),
      ),
    ));

Widget emergency(context) => Padding(
      padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
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
