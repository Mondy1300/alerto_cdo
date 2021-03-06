import 'package:alerto_cdo_v1/loading.dart';
import 'package:alerto_cdo_v1/screens/admin/admin_map.dart';
import 'package:alerto_cdo_v1/screens/admin/units.dart';
import 'package:alerto_cdo_v1/screens/admin/update_announcement.dart';
import 'package:alerto_cdo_v1/screens/admin/report_list.dart';
import 'package:alerto_cdo_v1/screens/help.dart';
import 'package:alerto_cdo_v1/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminHomeScreen extends StatelessWidget {
  final _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      appBar: AppBar(
        leading: null,
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
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/buttons/MAIN BG.png"),
              fit: BoxFit.cover)),
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              color: Color(0xffBA0F30),
              width: 400,
              height: 150,
              child: Units()),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, bottom: 20, top: 80, right: 20),
            child: viewReport(context),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
            child: updateAnnouncement(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
            child: postInfographics(),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 35, bottom: 20, right: 35),
          //   child: logout(),
          // ),
        ],
      ),
    );
  }

  Widget viewReport(BuildContext context) => Container(
      child: SizedBox(
          width: 300,
          height: 80,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new ReportList()));
            },
            child: Image(
              image: AssetImage("assets/buttons/view report.png"),
            ),
          )));

  Widget updateAnnouncement() => Container(
      child: SizedBox(
          width: 300,
          height: 80,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new UpdateAnnouncementScreen()));
            },
            child: Image(
              image: AssetImage("assets/buttons/update announcement.png"),
            ),
          )));

  Widget postInfographics() => Container(
      child: SizedBox(
          width: 300,
          height: 80,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new AdminMapScreen()));
            },
            child: Image(
              image: AssetImage("assets/buttons/map.png"),
            ),
          )));

  Widget logout() => Container(
          child: SizedBox(
        width: 300,
        height: 75,
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
}
