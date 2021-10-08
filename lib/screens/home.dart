import 'package:alerto_cdo_v1/screens/infographic.dart';
import 'package:alerto_cdo_v1/screens/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DASHBOARD',
          textAlign: TextAlign.center,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Text('Profile')),
            ListTile(
              title: Text('Account'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Gwapo'),
              onTap: () {},
            )
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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.all(2),
              color: Color(0xffff868c),
              child: SizedBox(
                width: 400,
                height: 200,
              )),
          first_row(context),
          second_row(),
          call_now(),
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
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
            child: SizedBox(
              width: 160,
              height: 80,
              child: OutlinedButton.icon(
                label: Text(
                  'Infographics',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new InfographicScreen()));
                },
                icon: Icon(Icons.menu_open_outlined),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xffff868c)),
                ),
              ),
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
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {},
                icon: Icon(Icons.menu_open_outlined),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xffff868c)),
                ),
              ),
            ),
          )
        ],
      ),
    );

Widget second_row() => Container(
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
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {},
                icon: Icon(Icons.account_box_sharp),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xffff868c)),
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
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {},
                icon: Icon(Icons.info),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xffff868c)),
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
