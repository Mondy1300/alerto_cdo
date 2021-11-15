import 'dart:developer';
import 'dart:ui';

import 'package:alerto_cdo_v1/model/user.dart';
import 'package:alerto_cdo_v1/screens/register.dart';
import 'package:alerto_cdo_v1/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:provider/provider.dart';

class SignUpFormScreen extends StatelessWidget {
  const SignUpFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SignUpForm(),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  DateTime selectedDate = DateTime.now();

  CollectionReference alerto_users =
      FirebaseFirestore.instance.collection('alerto_users');
  Users _user = Users();
  final AuthService _auth = AuthService();

  final firstDate = DateTime(1950, 1);
  final lastDate = DateTime(2021, 12);

  final _formKey = GlobalKey<FormState>();

  String email = '';
  String pass = '';

  TextEditingController _usernameCtrl = TextEditingController();
  TextEditingController _fnameCtrl = TextEditingController();
  TextEditingController _mnameCtrl = TextEditingController();
  TextEditingController _addressCtrl = TextEditingController();
  TextEditingController _lnameCtrl = TextEditingController();
  TextEditingController _passCtrl = TextEditingController();
  TextEditingController _conpassCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/bg.jpg"),
        fit: BoxFit.cover,
      )),
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              child: Image(image: AssetImage('assets/logo3.png')),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(125, 0, 0, 10),
              child: Text(
                'REGISTER',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            firstnameField(),
            middlenameField(),
            lastnameField(),
            dateField(),
            addressField(),
            usernameField(),
            passwordField(),
            conpasswordField(),
            btnRegister(),
          ],
        ),
      ),
    );
  }

  Widget dateField() => Container(
        child: Row(
          children: [
            Icon(Icons.date_range),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Text(
                'Date of Birth:',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: SizedBox(
                  child: Text(
                    '$selectedDate'.split(' ')[0],
                    style: TextStyle(fontSize: 18),
                  ),
                )),
            ElevatedButton(
              onPressed: () => _openDatePicker(context),
              child: Text('Select Date'),
            )
          ],
        ),
      );

  _openDatePicker(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (date != null) {
      setState(() {
        selectedDate = date;
        print('Date: $date');
      });
    }
  }

  Widget firstnameField() => TextFormField(
      controller: _fnameCtrl,
      validator: (value) {
        if (value!.isEmpty) return 'Please enter Firstname';
        return null;
      },
      onSaved: (value) {
        _user.firstName = value;
      },
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
          labelText: 'Firstname',
          icon: Icon(Icons.person),
          focusColor: Colors.black));

  Widget lastnameField() => TextFormField(
      controller: _lnameCtrl,
      validator: (value) {
        if (value!.isEmpty) return 'Please enter Lastname';
        return null;
      },
      onSaved: (value) {
        _user.lastName = value;
      },
      decoration: InputDecoration(
        labelText: 'Lastname',
        icon: Icon(Icons.person),
      ));

  Widget middlenameField() => TextFormField(
      controller: _mnameCtrl,
      validator: (value) {
        if (value!.isEmpty) return 'Please enter Middle name';
        return null;
      },
      onSaved: (value) {
        _user.middleName = value;
      },
      decoration: InputDecoration(
        labelText: 'Middle Name',
        icon: Icon(Icons.person),
      ));

  Widget addressField() => TextFormField(
      controller: _addressCtrl,
      validator: (value) {
        if (value!.isEmpty) return 'Please enter Address';
        return null;
      },
      onSaved: (value) {
        _user.address = value;
      },
      decoration: InputDecoration(
        labelText: 'Address',
        icon: Icon(Icons.location_city),
      ));

  Widget usernameField() => TextFormField(
      controller: _usernameCtrl,
      validator: (value) {
        if (value!.isEmpty) return 'Please enter Username';
        return null;
      },
      onSaved: (value) {
        _user.username = value;
      },
      // onChanged: (value) {
      //   setState(() => email = value);
      // },
      decoration: InputDecoration(
        labelText: 'Username',
        icon: Icon(Icons.verified_user),
      ));

  Widget passwordField() => TextFormField(
      controller: _passCtrl,
      validator: (value) {
        pass = value!;
        if (value.isEmpty) return 'Please enter Password';
        return null;
      },
      onSaved: (value) {
        _user.password = value;
      },
      // onChanged: (value) {
      //   setState(() => password = value);
      // },
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        icon: Icon(Icons.password),
      ));

  Widget conpasswordField() => TextFormField(
      controller: _conpassCtrl,
      validator: (value) {
        if (value!.isEmpty)
          return 'Please enter password';
        else if (value != pass) {
          return 'Password does not match';
        }
        return null;
      },
      // onSaved: (value) {
      //   _user.password = value;
      // },
      // onChanged: (value) {
      //   setState(() => password = value);
      // },
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        icon: Icon(Icons.password),
      ));

  Widget btnRegister() => Container(
        margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              inspect(_user);
              addUsers();

              // // dynamic result = await _auth.signInAnon();
              // // print(result.uid);

              // final uid = await Provider.of(context).auth.getCurrentUID()
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new RegisterScreen()));
            } else {
              _usernameCtrl.clear();
              _fnameCtrl.clear();
              _mnameCtrl.clear();
              _lnameCtrl.clear();
              _passCtrl.clear();
              _conpassCtrl.clear();
            }
            // dynamic result = await _auth.signInAnon();
            // if (result == null) {
            //   print('error signing in');
            // } else {
            //   print('signed in');
            //   print(result.uid);
            // }
          },
          child: Text('REGISTER'),
        ),
      );

  Future<void> addUsers() {
    return alerto_users
        .add({
          'Firstname': _user.firstName,
          'Lastname': _user.lastName,
          'Middle Name': _user.middleName,
          'Address': _user.address,
          'Username': _user.username,
          'Password': _user.password,
        })
        .then((value) {})
        .catchError((onError) => print('Failed to add user!'));
  }
}
