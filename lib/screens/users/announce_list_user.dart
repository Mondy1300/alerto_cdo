import 'package:alerto_cdo_v1/loading.dart';
import 'package:alerto_cdo_v1/screens/users/announce_details_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AnnouncelistUser extends StatefulWidget {
  const AnnouncelistUser({Key? key}) : super(key: key);

  @override
  _AnnouncelistUserState createState() => _AnnouncelistUserState();
}

class _AnnouncelistUserState extends State<AnnouncelistUser> {
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
                          builder: (context) => AnnounceDetailsUser(
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
