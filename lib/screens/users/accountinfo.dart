import 'package:alerto_cdo_v1/loading.dart';
import 'package:alerto_cdo_v1/model/user.dart';
import 'package:alerto_cdo_v1/services/auth_service.dart';
import 'package:alerto_cdo_v1/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({Key? key}) : super(key: key);

  @override
  _AccountInfoScreenState createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile'),
      ),
      body: AccountBody(),
    );
  }
}

class AccountBody extends StatefulWidget {
  const AccountBody({Key? key}) : super(key: key);

  @override
  _AccountBodyState createState() => _AccountBodyState();
}

class _AccountBodyState extends State<AccountBody> {
  @override
  Widget build(BuildContext context) {
    String? userid;
    FirebaseAuth auth = FirebaseAuth.instance;

    userid = auth.currentUser!.uid;
    print(userid);

    TextEditingController firstname = TextEditingController();

    final _formKey = GlobalKey<FormState>();
    String? _firstname;
    String? _middlename;
    String? _lastname;
    String? _birthday;
    String? _address;
    String? _contactNum;

    return Container(
      child: StreamBuilder<UserData>(
          stream: DatabaseService(uid: userid).userData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              UserData? userData = snapshot.data;
              return Form(
                  key: _formKey,
                  child: ListView(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 70.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: SizedBox(
                          width: 300,
                          child: TextFormField(
                            initialValue: userData!.firstname,
                            validator: (val) =>
                                val!.isEmpty ? 'Please enter firstname' : null,
                            onSaved: (val) => setState(() => _firstname = val),
                            decoration: InputDecoration(
                              hintText: 'Firstname',
                              contentPadding: EdgeInsets.all(16.0),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: SizedBox(
                          width: 300,
                          child: TextFormField(
                            validator: (val) =>
                                val!.isEmpty ? 'Please enter middlename' : null,
                            initialValue: userData.middlename,
                            onSaved: (val) => setState(() => _middlename = val),
                            decoration: InputDecoration(
                              labelText: 'Middlename',
                              contentPadding: EdgeInsets.all(16.0),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: SizedBox(
                          width: 300,
                          child: TextFormField(
                            validator: (val) =>
                                val!.isEmpty ? 'Please enter lastname' : null,
                            initialValue: userData.lastname,
                            onSaved: (val) => setState(() => _lastname = val),
                            decoration: InputDecoration(
                              labelText: 'Lastname',
                              contentPadding: EdgeInsets.all(16.0),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.pink, width: 2.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: SizedBox(
                          width: 300,
                          child: TextFormField(
                            validator: (val) => val!.isEmpty
                                ? 'Please enter Date of Birth'
                                : null,
                            initialValue: userData.birthday,
                            onSaved: (val) => setState(() => _birthday = val),
                            decoration: InputDecoration(
                              labelText: 'Date of Birth',
                              contentPadding: EdgeInsets.all(16.0),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.pink, width: 2.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: SizedBox(
                          width: 300,
                          child: TextFormField(
                            validator: (val) =>
                                val!.isEmpty ? 'Please enter address' : null,
                            initialValue: userData.address,
                            onSaved: (val) => setState(() => _address = val),
                            decoration: InputDecoration(
                              labelText: 'Address',
                              contentPadding: EdgeInsets.all(16.0),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.pink, width: 2.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: SizedBox(
                          width: 300,
                          child: TextFormField(
                            validator: (val) => val!.isEmpty
                                ? 'Please enter Contact Number'
                                : null,
                            initialValue: userData.contactNum.toString(),
                            onSaved: (val) => setState(() => _contactNum = val),
                            decoration: InputDecoration(
                              labelText: 'Contact Number',
                              contentPadding: EdgeInsets.all(16.0),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.pink, width: 2.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: SizedBox(
                          width: 200,
                          height: 50,
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                print(_firstname);
                                print(_middlename);
                                print(_lastname);
                                await DatabaseService(uid: userid)
                                    .updateUserData(
                                  _firstname ?? snapshot.data!.firstname,
                                  _middlename ?? snapshot.data!.middlename,
                                  _lastname ?? snapshot.data!.lastname,
                                  _birthday ?? snapshot.data!.birthday,
                                  _address ?? snapshot.data!.address,
                                  _contactNum ?? snapshot.data!.contactNum,
                                );

                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      popUpDialog(context),
                                );
                              }
                            },
                            icon: Icon(Icons.update),
                            label: Text('Update'),
                          ),
                        ),
                      )
                    ],
                  ));
            } else {
              // return Text(snapshot.error.toString());
              return Loading();
            }
          }),
    );
  }

  Widget popUpDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xffBA0F30),
      contentTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      title: Text(
        'USER SUCCESFULLY UPDATED!',
        style: TextStyle(color: Colors.white),
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
