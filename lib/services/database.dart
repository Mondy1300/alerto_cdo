import 'dart:io';

import 'package:alerto_cdo_v1/model/announcement.dart';
import 'package:alerto_cdo_v1/model/report.dart';
import 'package:alerto_cdo_v1/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final String? uid;
  final String? reportid;
  DatabaseService({this.uid, this.reportid});

  FirebaseAuth auth = FirebaseAuth.instance;

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('alerto_users');

  final CollectionReference reportCollection =
      FirebaseFirestore.instance.collection('reports');

  final CollectionReference announceCollection =
      FirebaseFirestore.instance.collection('announcements');

  // final QuerySnapshot querySnap =
  //     FirebaseFirestore.instance.collection('reports').getDocuments();

  Future<void> updateUserData(
      String? firstname,
      String? middlename,
      String? lastname,
      String? birthday,
      String? address,
      String? contactNum) async {
    return await userCollection.doc(uid).set({
      'firstname': firstname,
      'middlename': middlename,
      'lastname': lastname,
      'birthday': birthday,
      'address': address,
      'contactNum': contactNum,
    });
  }

  //create report
  Future<void> createReport(
    String? description,
    String? userid,
    List? name,
    String? contactnum,
    String? imageUrl,
    String? type,
  ) async {
    return await reportCollection.doc().set({
      'description': description,
      'userid': userid,
      'name': name,
      'contact number': contactnum,
      'image url': imageUrl,
      'emergency type': type,
    });
  }

  Future<void> createAnnouncement(
    String? imgUrl,
    String? details,
    String? status,
  ) async {
    return await announceCollection.doc().set({
      'imgUrl': imgUrl,
      'details': details,
      'status': status,
    });
  }

  // Users _userDataFromSnapshot(DocumentSnapshot snapshot) {
  //   return Users(
  //     uid: uid,
  //     firstName: snapshot['Firstname'],
  //     middleName: snapshot['Middle Name'],
  //     lastName: snapshot['Lastname'],
  //     address: snapshot['Address'],
  //     username: snapshot['Username'],
  //     password: snapshot['Password'],
  //   );
  // }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      firstname: snapshot.data().toString().contains('firstname')
          ? snapshot.get('firstname')
          : '',
      middlename: snapshot.data().toString().contains('middlename')
          ? snapshot.get('middlename')
          : '',
      lastname: snapshot.data().toString().contains('lastname')
          ? snapshot.get('lastname')
          : '',
      birthday: snapshot.data().toString().contains('birthday')
          ? snapshot.get('birthday')
          : '',
      address: snapshot.data().toString().contains('address')
          ? snapshot.get('address')
          : '',
      contactNum: snapshot.data().toString().contains('contactNum')
          ? snapshot.get('contactNum')
          : '',
    );
  }

  Report _singleReportFromSnapshot(DocumentSnapshot snapshot) {
    return Report(
      uid: uid,
      description: snapshot.data().toString().contains('description')
          ? snapshot.get('description')
          : '',
      contactnum: snapshot.data().toString().contains('contact number')
          ? snapshot.get('contact number')
          : '',
      type: snapshot.data().toString().contains('emergency type')
          ? snapshot.get('emergency type')
          : '',
      name: snapshot.data().toString().contains('name')
          ? snapshot.get('name')
          : '',
      userid: snapshot.data().toString().contains('userid')
          ? snapshot.get('userid')
          : '',
      imageUrl: snapshot.data().toString().contains('image url')
          ? snapshot.get('image url')
          : '',
    );
  }

  //report list from snapshot

  List<Report> _reportListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Report(
          name: doc['name'] ?? '',
          userid: doc['userid'] ?? '',
          type: doc['type'] ?? '',
          description: doc['description'] ?? '',
          contactnum: doc['contact_number'] ?? '');
    }).toList();
  }

  List<Announcement> _announceListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Announcement(
        details: doc['details'] ?? '',
        imgUrl: doc['imgUrl'] ?? '',
        status: doc['staus'] ?? '',
      );
    }).toList();
  }

  Stream<UserData> get userData {
    return userCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

  //get report stream
  Stream<List<Report>> get report {
    return reportCollection.snapshots().map(_reportListFromSnapshot);
  }

  //get single report stream
  Stream<Report> get singleReport {
    return reportCollection.doc(uid).snapshots().map(_singleReportFromSnapshot);
  }

  Stream<List<Announcement>> get announcement {
    return reportCollection.snapshots().map(_announceListFromSnapshot);
  }
}
