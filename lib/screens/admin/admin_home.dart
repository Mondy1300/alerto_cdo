import 'package:alerto_cdo_v1/screens/admin/admin_viewreport.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 95),
              child: Text(
                'ADMIN',
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 85),
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
      body: AdminBody(),
    );
  }
}

class AdminBody extends StatefulWidget {
  const AdminBody({Key? key}) : super(key: key);

  @override
  _AdminBodyState createState() => _AdminBodyState();
}

class _AdminBodyState extends State<AdminBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50, bottom: 20),
            child: viewReport(context),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, bottom: 20),
            child: updateAnnouncement(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, bottom: 20),
            child: postInfographics(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, bottom: 20),
            child: logout(),
          ),
        ],
      ),
    );
  }
}

Widget viewReport(BuildContext context) => Container(
        child: SizedBox(
      width: 300,
      height: 80,
      child: OutlinedButton.icon(
        onPressed: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => new ViewReportScreen()));
        },
        icon: Icon(
          Icons.view_agenda,
          color: Colors.white,
          size: 40,
        ),
        label: Text(
          'VIEW REPORT',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xffBA0F30)),
        ),
      ),
    ));

Widget updateAnnouncement() => Container(
        child: SizedBox(
      width: 300,
      height: 80,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Icon(
          Icons.update,
          color: Colors.white,
          size: 40,
        ),
        label: Text(
          'UPDATE ANNOUNCEMENT',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xffBA0F30)),
        ),
      ),
    ));

Widget postInfographics() => Container(
        child: SizedBox(
      width: 300,
      height: 80,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Icon(
          Icons.push_pin,
          color: Colors.white,
          size: 40,
        ),
        label: Text(
          'POST INFOGRAPHICS',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xffBA0F30)),
        ),
      ),
    ));

Widget logout() => Container(
        child: SizedBox(
      width: 300,
      height: 80,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Icon(
          Icons.logout,
          color: Colors.white,
          size: 40,
        ),
        label: Text(
          'LOGOUT',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xff828282)),
        ),
      ),
    ));
