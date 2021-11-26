import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AnnounceDetailsUser extends StatelessWidget {
  final String? docID;
  final String? details;
  final String? image;
  const AnnounceDetailsUser(
      {Key? key,
      required this.docID,
      required this.details,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('ANNOUNCEMENT DETAILS')),
        backgroundColor: Colors.black,
      ),
      body: DetailsBody(
        details: details,
        imageURL: image,
        docID: docID,
      ),
    );
  }
}

class DetailsBody extends StatelessWidget {
  final String? details;
  final String? imageURL;
  final String? docID;
  const DetailsBody(
      {Key? key,
      required this.docID,
      required this.details,
      required this.imageURL})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/buttons/MAIN BG.png"),
              fit: BoxFit.cover)),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(155, 35, 10, 10),
            child: Text(
              'DETAILS',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Container(
              color: Colors.white,
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Text(
                    details!,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(155, 15, 10, 10),
            child: Text(
              'IMAGE',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Container(
              height: 400,
              color: Colors.white,
              child: Image.network(
                imageURL!,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomButtons(BuildContext context) => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 7),
              child: make_new(context),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 7),
              child: clear(context),
            ),
          ],
        ),
      );

  Widget make_new(BuildContext context) => Padding(
        padding: const EdgeInsets.all(2.0),
        child: SizedBox(
          width: 160,
          height: 50,
          child: OutlinedButton.icon(
            label: Text(
              'BACK',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              // Navigator.push(
              //     context,
              //     new MaterialPageRoute(
              //         builder: (context) => NewAnnouncementScreen()));
            },
            icon: Icon(
              Icons.backspace,
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
            onPressed: () {
              String clear = 'clear';
              var collection =
                  FirebaseFirestore.instance.collection('announcements');
              collection.doc(docID).update({'status': clear});

              Navigator.of(context).pop();
            },
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
