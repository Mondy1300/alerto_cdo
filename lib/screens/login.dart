import 'package:alerto_cdo_v1/screens/reset_screen.dart';
import 'package:alerto_cdo_v1/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover)),
        child: ListView(
          children: [
            Container(
              child: Image(image: AssetImage('assets/logo3.png')),
            ),
            // Container(
            //   padding: EdgeInsets.fromLTRB(165, 0, 0, 10),
            //   child: Text(
            //     'LOGIN',
            //     style: TextStyle(
            //       fontSize: 24,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                      child: TextFormField(
                        validator: (value) =>
                            value!.isEmpty ? 'Enter an email' : null,
                        onChanged: (value) {
                          setState(() => email = value);
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none),
                            labelText: "E-mail",
                            filled: true,
                            fillColor: Color(0xffff868c)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                      child: TextFormField(
                        validator: (value) => value!.length < 6
                            ? 'Enter a password 6+ chars long'
                            : null,
                        onChanged: (value) {
                          setState(() => password = value);
                        },
                        obscureText: !_passwordVisible,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.red,
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none),
                            labelText: "Password",
                            filled: true,
                            fillColor: Color(0xffff868c)),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResetScreen()));
                      },
                      child: Text("Forgot Password?"),
                    ),
                    Text(
                      error,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(5, 20, 0, 20),
                        child: SizedBox(
                          width: 230,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                print('valid');
                                dynamic result =
                                    await _auth.signInWithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(
                                      () => error = 'Invalid Credentials!');
                                }
                              }
                              //
                              // Navigator.push(
                              //     context,
                              //     new MaterialPageRoute(
                              //         builder: (context) => new HomeScreen()));
                            },
                            child: Text('SIGN IN'),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
