import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

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

  final firstDate = DateTime(1950, 1);
  final lastDate = DateTime(2021, 12);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/bg.jpg"),
        fit: BoxFit.cover,
      )),
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
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
          lastnameField(),
          middlenameField(),
          dateField(),
          addressField(),
          btnRegister(),
        ],
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
}

Widget firstnameField() => TextFormField(
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
        labelText: 'Firstname',
        icon: Icon(Icons.person),
        focusColor: Colors.black));

Widget lastnameField() => TextFormField(
        decoration: InputDecoration(
      labelText: 'Lastname',
      icon: Icon(Icons.person),
    ));

Widget middlenameField() => TextFormField(
        decoration: InputDecoration(
      labelText: 'Middle Name',
      icon: Icon(Icons.person),
    ));

Widget addressField() => TextFormField(
        decoration: InputDecoration(
      labelText: 'Address',
      icon: Icon(Icons.person),
    ));

Widget btnRegister() => Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: ElevatedButton(
        onPressed: () {},
        child: Text('REGISTER'),
      ),
    );
