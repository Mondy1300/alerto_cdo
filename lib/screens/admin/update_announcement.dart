import 'dart:io';

import 'package:alerto_cdo_v1/screens/admin/new_announcement.dart';
import 'package:alerto_cdo_v1/screens/announce_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../loading.dart';

class UpdateAnnouncementScreen extends StatelessWidget {
  const UpdateAnnouncementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'UPDATE ANNOUNCEMENT',
              ),
            ),
            // Container(
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 5),
            //     child: Image.asset(
            //       'assets/logo3.png',
            //       fit: BoxFit.contain,
            //       height: 50,
            //     ),
            //   ),
            // )
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: UpdateAnnouncementBody(),
    );
  }
}

class UpdateAnnouncementBody extends StatefulWidget {
  const UpdateAnnouncementBody({Key? key}) : super(key: key);

  @override
  _UpdateAnnouncementBodyState createState() => _UpdateAnnouncementBodyState();
}

class _UpdateAnnouncementBodyState extends State<UpdateAnnouncementBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/buttons/MAIN BG.png"),
              fit: BoxFit.cover)),
      child: Stack(children: [
        Announcelist(),
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
        )
      ]),
    );
  }

  Widget bottomButtons(BuildContext context) => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 7),
              child: make_new(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 7),
              child: clear(context),
            ),
          ],
        ),
      );

  Widget make_new() => Padding(
        padding: const EdgeInsets.all(2.0),
        child: SizedBox(
          width: 160,
          height: 50,
          child: OutlinedButton.icon(
            label: Text(
              'MAKE NEW',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => NewAnnouncementScreen()));
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xffFF0000)),
            ),
          ),
        ),
      );

  Widget clear(context) => Padding(
        padding: const EdgeInsets.all(2),
        child: SizedBox(
          width: 160,
          height: 50,
          child: OutlinedButton.icon(
            label: Text(
              'CLEAR',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
            icon: Icon(
              Icons.clear,
              color: Colors.white,
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xffFF0000)),
            ),
          ),
        ),
      );
}
