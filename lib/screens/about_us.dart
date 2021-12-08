import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/buttons/MAIN BG.png"),
                fit: BoxFit.cover)),
        child: ListView(
          children: [
            Container(
              child: Image(image: AssetImage('assets/markers/aboutus.png')),
            )
          ],
        ),
      ),
    );
  }
}
