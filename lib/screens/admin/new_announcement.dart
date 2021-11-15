import 'dart:io';

import 'package:alerto_cdo_v1/loading.dart';
import 'package:alerto_cdo_v1/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewAnnouncementScreen extends StatefulWidget {
  const NewAnnouncementScreen({Key? key}) : super(key: key);

  @override
  _NewAnnouncementScreenState createState() => _NewAnnouncementScreenState();
}

class _NewAnnouncementScreenState extends State<NewAnnouncementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                '',
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: NewAnnoucementBody(),
    );
  }
}

class NewAnnoucementBody extends StatefulWidget {
  const NewAnnoucementBody({Key? key}) : super(key: key);

  @override
  _NewAnnoucementBodyState createState() => _NewAnnoucementBodyState();
}

class _NewAnnoucementBodyState extends State<NewAnnoucementBody> {
  final detController = TextEditingController();
  String? txtval;
  File? _image;
  String status = 'active';
  Future getImage(ImageSource source) async {
    final image =
        await ImagePicker().getImage(source: source, imageQuality: 10);

    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(165, 65, 10, 10),
            child: Text(
              'DETAILS',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
            child: Container(
              height: 200,
              child: TextField(
                controller: detController,
                decoration: const InputDecoration(
                  hintText: "Enter Details . . .",
                  contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(135, 0, 10, 5),
            child: Text(
              'ATTACH PHOTO',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          camRow(),
          Container(
              height: 450,
              width: 550,
              margin: EdgeInsets.only(top: 20),
              child: Center(
                child: _image == null
                    ? Text("Image not loaded")
                    : Container(child: Image(image: FileImage(_image!))),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            child: Container(
              child: FloatingActionButton.extended(
                icon: Icon(Icons.image),
                label: Text('Submit'),
                onPressed: () async {
                  // txtval = detController.toString();
                  DateTime phonetime = DateTime.now();
                  final ref = FirebaseStorage.instance
                      .ref()
                      .child("announce_img")
                      .child(phonetime.toString() + '.jpg');
                  await ref.putFile(_image!);
                  String? imageUrl = await ref.getDownloadURL();

                  DatabaseService()
                      .createAnnouncement(imageUrl, detController.text, status);

                  showDialog(
                    context: context,
                    builder: (BuildContext context) => popUpDialog(context),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      Container(
        color: Colors.red,
        child: SizedBox(
          width: 400,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(100, 10, 10, 10),
            child: Text(
              'MAKE ANNOUNCEMENT',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    ]);
  }

  Widget camRow() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton.icon(
              onPressed: () {
                getImage(ImageSource.camera);
              },
              icon: Icon(Icons.camera),
              label: Text('Camera'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton.icon(
              onPressed: () {
                getImage(ImageSource.gallery);
              },
              icon: Icon(Icons.album),
              label: Text('Gallery'),
            ),
          ),
        ],
      );

  Widget popUpDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xffBA0F30),
      contentTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      title: Text(
        'ANNOUNCEMENT SUCCESFULLY SENT',
        style: TextStyle(color: Colors.white),
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Thank you!'),
        ],
      ),
      actions: [
        TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.blueGrey),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: Text('OK'))
      ],
    );
  }
}
