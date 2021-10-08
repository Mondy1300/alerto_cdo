import 'package:alerto_cdo_v1/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none),
                          labelText: "Username or E-mail",
                          filled: true,
                          fillColor: Color(0xffff868c)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    child: TextFormField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none),
                          labelText: "Password",
                          filled: true,
                          fillColor: Color(0xffff868c)),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(5, 20, 0, 20),
                      child: SizedBox(
                        width: 230,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new HomeScreen()));
                          },
                          child: Text('LOGIN'),
                        ),
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}