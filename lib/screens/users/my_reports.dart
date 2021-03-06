import 'package:alerto_cdo_v1/screens/users/report_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../loading.dart';

class MyReportsScreen extends StatefulWidget {
  const MyReportsScreen({Key? key}) : super(key: key);

  @override
  _MyReportsScreenState createState() => _MyReportsScreenState();
}

class _MyReportsScreenState extends State<MyReportsScreen> {
  @override
  Widget build(BuildContext context) {
    String? userid;
    FirebaseAuth auth = FirebaseAuth.instance;
    userid = auth.currentUser!.uid;
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  'MY REPORTS',
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 65),
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
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('reports')
              .where('userid', isEqualTo: userid)
              .orderBy('date_time')
              .snapshots(),
          builder: buildReportList,
        ));
  }

  Widget buildReportList(
      BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasData) {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/buttons/MAIN BG.png"),
                fit: BoxFit.cover)),
        child: Align(
          alignment: Alignment.topCenter,
          child: ListView.builder(
            shrinkWrap: true,
            reverse: true,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              String? type;
              DocumentSnapshot report = snapshot.data!.docs[index];
              type = report['emergency type'].toString();
              return Padding(
                padding: EdgeInsets.only(top: 8),
                child: Card(
                  margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                  child: ListTile(
                    trailing: (report['status'] == 'DISPATCHED')
                        ? Icon(
                            Icons.verified_rounded,
                            color: Colors.yellow,
                            size: 30,
                          )
                        : (report['status'] == 'RESOLVED')
                            ? Icon(
                                Icons.verified_rounded,
                                color: Colors.green,
                                size: 30,
                              )
                            : null,
                    leading: (report['image url'] == null)
                        ? Icon(
                            Icons.report,
                            size: 50,
                            color: Colors.red,
                          )
                        : CircleAvatar(
                            backgroundImage:
                                (NetworkImage(report['image url'])),
                            radius: 25,
                          ),
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8),
                      child: Text(type),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(report['date_time']),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => MyReportsDetails(
                                  date: report['date_time'].toString(),
                                  rep_status: report['status'],
                                  docid: report.id,
                                  latitude: report['latitude'],
                                  longitude: report['longitude'],
                                  contact: report['contact number'],
                                  details: report['description'],
                                  img: report['image url'],
                                  type: report['emergency type'])));
                    },
                  ),
                ),
              );
            },
          ),
        ),
      );
    } else if (snapshot.connectionState == ConnectionState.done &&
        !snapshot.hasData) {
      return Center(
        child: Text("No users found."),
      );
    } else {
      return Loading();
    }
  }
}
