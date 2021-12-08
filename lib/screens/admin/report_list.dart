import 'package:alerto_cdo_v1/loading.dart';
import 'package:alerto_cdo_v1/screens/admin/admin_viewreport.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ReportList extends StatefulWidget {
  const ReportList({Key? key}) : super(key: key);

  @override
  _ReportListState createState() => _ReportListState();
}

class _ReportListState extends State<ReportList> {
  @override
  Widget build(BuildContext context) {
    PageController _pgcontroller = new PageController();
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
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/buttons/MAIN BG.png"),
                  fit: BoxFit.cover)),
          child: Stack(children: [
            PageView(
              controller: _pgcontroller,
              children: [
                first(),
                second(),
                third(),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    child: Center(
                  child: SmoothPageIndicator(
                    controller: _pgcontroller,
                    count: 3,
                    effect: WormEffect(),
                    onDotClicked: (index) => _pgcontroller.animateToPage(index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.bounceOut),
                  ),
                ))
              ],
            )
          ])),
    );
  }

  StreamBuilder<QuerySnapshot<Map<String, dynamic>>> first() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('reports')
          .where('status', isEqualTo: 'WAITING')
          .orderBy('date_time')
          .snapshots(),
      builder: buildReportList,
    );
  }

  Widget buildReportList(
      BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasData) {
      return Align(
        alignment: Alignment.topCenter,
        child: Stack(
          children: [
            ListView.builder(
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    child: Center(
                  child: Image(
                    image: AssetImage("assets/buttons/waiting.png"),
                  ),
                )),
              ],
            ),
          ],
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

  StreamBuilder<QuerySnapshot<Map<String, dynamic>>> second() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('reports')
          .where('status', isEqualTo: 'DISPATCHED')
          .orderBy('date_time')
          .snapshots(),
      builder: buildReportList2,
    );
  }

  Widget buildReportList2(
      BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasData) {
      return Align(
        alignment: Alignment.topCenter,
        child: Stack(
          children: [
            ListView.builder(
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    child: Center(
                  child: Image(
                    image: AssetImage("assets/buttons/dispatched.png"),
                  ),
                )),
              ],
            ),
          ],
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

  StreamBuilder<QuerySnapshot<Map<String, dynamic>>> third() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('reports')
          .where('status', isEqualTo: 'RESOLVED')
          .orderBy('date_time')
          .snapshots(),
      builder: buildReportList3,
    );
  }

  Widget buildReportList3(
      BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasData) {
      return Align(
        alignment: Alignment.topCenter,
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 95.0),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  child: Center(
                child: Image(
                  image: AssetImage("assets/buttons/resolved.png"),
                ),
              )),
            ],
          ),
        ]),
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
