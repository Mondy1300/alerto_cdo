import 'package:alerto_cdo_v1/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class Units extends StatelessWidget {
  const Units({Key? key, available}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: _buildRep,
      stream: FirebaseFirestore.instance
          .collection('units')
          .doc('110011')
          .snapshots(),
    );
  }

  Widget _buildRep(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      return Builder(builder: (BuildContext newconts) {
        DocumentSnapshot unitsnap = snapshot.data;
        return Container(
            color: Color(0xffBA0F30),
            width: 400,
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 25),
                      child: Container(
                        height: 70,
                        width: 70,
                        child: Center(
                          child: Text(
                            '15',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                        decoration: new BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.yellow, width: 3)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 25),
                      child: Container(
                        height: 70,
                        width: 70,
                        child: Center(
                          child: Text(
                            unitsnap.get('available').toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                        decoration: new BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.yellow, width: 3)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 70,
                        width: 70,
                        child: Center(
                          child: Text(
                            unitsnap.get('dispatched').toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                        decoration: new BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.yellow, width: 3)),
                      ),
                    )
                  ],
                ),
                lowerRow(),
              ],
            ));
      });
    } else if (snapshot.connectionState == ConnectionState.done &&
        !snapshot.hasData) {
      return Center(child: Text("No data found."));
    } else {
      return Loading();
    }
  }

  Widget lowerRow() => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 53, right: 20, top: 5),
            child: Text(
              'ALL UNITS',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 35, right: 20, top: 5),
            child: Text(
              'AVAILABLE\nUNITS',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 10, top: 5),
            child: Text(
              'DISPATCHED\nUNITS',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          )
        ],
      );
}
