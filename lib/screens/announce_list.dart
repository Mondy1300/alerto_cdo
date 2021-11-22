import 'package:alerto_cdo_v1/screens/announce_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../loading.dart';

class Announcelist extends StatefulWidget {
  const Announcelist({Key? key}) : super(key: key);

  @override
  _AnnouncelistState createState() => _AnnouncelistState();
}

class _AnnouncelistState extends State<Announcelist> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: _buildAnnounce,
      stream: FirebaseFirestore.instance
          .collection('announcements')
          .where('status', isEqualTo: 'active')
          .snapshots(),
    );
  }
}

Widget _buildAnnounce(
    BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  if (snapshot.hasData) {
    return ListView.builder(
        itemCount: snapshot.data!.docs.length,
        itemBuilder: (context, index) {
          DocumentSnapshot announce = snapshot.data!.docs[index];
          String? docid = announce.id;
          return Padding(
            padding: EdgeInsets.only(top: 8),
            child: Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => AnnounceDetails(
                                details: announce['details'],
                                image: announce['imgUrl'],
                                docID: docid,
                              )));
                },
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(announce['imgUrl']),
                  radius: 25,
                ),
                // leading: Icon(
                //   Icons.report,
                //   size: 50,
                //   color: Colors.red,
                // ),
                // title: Text(type),
                subtitle: Text(announce['details']),
              ),
            ),
          );
        });
  } else if (snapshot.connectionState == ConnectionState.done &&
      !snapshot.hasData) {
    return Center(child: Text("No data found."));
  } else {
    return Loading();
  }
}
