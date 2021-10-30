import 'package:alerto_cdo_v1/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('alerto_users');

  Users _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return Users(
      uid: uid,
      firstName: snapshot['Firstname'],
      middleName: snapshot['Middle Name'],
      lastName: snapshot['Lastname'],
      address: snapshot['Address'],
      username: snapshot['Username'],
      password: snapshot['Password'],
    );
  }

  Stream<Users> get userData {
    return userCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
