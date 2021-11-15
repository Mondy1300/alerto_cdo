import 'package:alerto_cdo_v1/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:alerto_cdo_v1/model/user.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Users? _userFromFirebaseUser(User user) {
    if (user != null) {
      return Users(uid: user.uid);
    } else {
      return null;
    }
  }

  Stream<Users?> get user {
    return _firebaseAuth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user!));
  }

  //get uid
  Future<String> getCurrentUID() async {
    return (await _firebaseAuth.currentUser!).uid;
  }

  //get current user
  Future getCurrentUser() async {
    return await _firebaseAuth.currentUser!;
  }

  //register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = result.user;

      //create new docu
      await DatabaseService(uid: user!.uid)
          .updateUserData('name', 'middle', 'last', 'dob', 'address', '0');

      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  //sign in anonymous
  Future signInAnon() async {
    try {
      UserCredential result = await _firebaseAuth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //signout
  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}

// class AuthService {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();

//   getProfileImage() {
//     return Image.network(_firebaseAuth.currentUser?.displayName ?? '',
//         height: 100, width: 100);
//     // } else {
//     //   return Icon(Icons.account_circle, size: 100);
//     // }
//   }
// }
