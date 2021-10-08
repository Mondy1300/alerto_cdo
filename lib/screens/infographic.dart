import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfographicScreen extends StatelessWidget {
  const InfographicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'INFOGRAPHICS',
          textAlign: TextAlign.center,
        ),
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
              margin: EdgeInsets.all(2),
              color: Color(0xffff868c),
              child: SizedBox(
                width: 400,
                height: 200,
              )),
          first_row(context),
          second_row(context),
          third_row(context),
          fourth_row(context),
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
            child: Text('Flood', style: TextStyle(color: Colors.black)),
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xffff868c)),
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
            child: Text('Fire', style: TextStyle(color: Colors.black)),
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xffff868c)),
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
            child: Text('Tornado', style: TextStyle(color: Colors.black)),
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xffff868c)),
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
            child: Text('Hurricane', style: TextStyle(color: Colors.black)),
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xffff868c)),
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
            child: Text('Car Crash', style: TextStyle(color: Colors.black)),
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xffff868c)),
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
            child: Text('Landslde', style: TextStyle(color: Colors.black)),
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xffff868c)),
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
            child: Text('Drowning', style: TextStyle(color: Colors.black)),
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xffff868c)),
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
            child: Text('Earthquake', style: TextStyle(color: Colors.black)),
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xffff868c)),
            )),
      ),
    ));
