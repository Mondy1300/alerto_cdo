import 'package:alerto_cdo_v1/loading.dart';
import 'package:alerto_cdo_v1/model/report.dart';
import 'package:alerto_cdo_v1/screens/admin/admin_viewreport.dart';
import 'package:alerto_cdo_v1/screens/report_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportList extends StatefulWidget {
  const ReportList({Key? key}) : super(key: key);

  @override
  _ReportListState createState() => _ReportListState();
}

class _ReportListState extends State<ReportList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text(
                'VIEW REPORTS',
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
            .orderBy('date_time')
            .snapshots(),
        builder: buildReportList,
      ),
    );
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
            reverse: true,
            shrinkWrap: true,
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
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(report['image url']),
                          radius: 25,
                        ),
                        // leading: Icon(
                        //   Icons.report,
                        //   size: 50,
                        //   color: Colors.red,
                        // ),
                        title: Text(
                          type,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(report['date_time']),
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
                        onTap: () {
                          print(report['longitude']);
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new ViewReportScreen(
                                        date_time:
                                            report['date_time'].toString(),
                                        rep_status: report['status'],
                                        docid: report.id,
                                        details: report['description'],
                                        type: report['emergency type'],
                                        sender: report['name'].toString(),
                                        img: report['image url'],
                                        contact: report['contact number'],
                                        latitude: report['latitude'],
                                        longitude: report['longitude'],
                                      )));
                        }),
                  ));
            },
          ),
        ),
      );
    } else if (snapshot.connectionState == ConnectionState.done &&
        !snapshot.hasData) {
      return Center(
        child: Text("No data found."),
      );
    } else {
      return Loading();
    }
  }
}

// class Firestore {}





// class BrewList extends StatefulWidget {
//   @override
//   _BrewListState createState() => _BrewListState();
// }

// class _BrewListState extends State<BrewList> {
//   @override
//   Widget build(BuildContext context) {

//     final brews = Provider.of<List<Brew>>(context);

//     return ListView.builder(
//       itemCount: brews.length,
//       itemBuilder: (context, index) {
//         return BrewTile(brew: brews[index]);
//       },
//     );
//   }
// }