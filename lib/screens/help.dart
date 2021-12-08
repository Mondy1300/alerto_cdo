import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  // const HelpScreen({Key? key}) : super(key: key);

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController details = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/buttons/MAIN BG.png"),
                fit: BoxFit.cover)),
        child: ListView(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 50),
                child: Image(image: AssetImage('assets/markers/contact.png')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child:
                    Image(image: AssetImage('assets/markers/getintouch.png')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 50,
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "Name",
                    contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                    fillColor: Colors.white60,
                    filled: true,
                  ),
                  controller: name,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 50,
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "Email",
                    contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                    fillColor: Colors.white60,
                    filled: true,
                  ),
                  controller: email,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 150,
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "Message",
                    contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                    fillColor: Colors.white60,
                    filled: true,
                  ),
                  controller: details,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 70, right: 70),
              child: SizedBox(
                  width: 180,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("SEND", style: TextStyle(fontSize: 18)),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff828282)),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 15),
              child: Container(
                child:
                    Image(image: AssetImage('assets/markers/contact_bot.png')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
