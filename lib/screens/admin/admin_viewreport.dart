import 'package:alerto_cdo_v1/model/report.dart';
import 'package:alerto_cdo_v1/screens/admin/dispatch.dart';
import 'package:alerto_cdo_v1/services/database.dart';
import 'package:flutter/material.dart';

import '../../loading.dart';

class ViewReportScreen extends StatelessWidget {
  final String? details;
  final String? img;
  final String? sender;
  final String? type;
  final String? contact;
  const ViewReportScreen(
      {Key? key,
      required this.contact,
      required this.details,
      required this.img,
      required this.sender,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 90),
              child: Text(
                'REPORT',
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 80),
                child: Image.asset(
                  'assets/logo3.png',
                  fit: BoxFit.contain,
                  height: 50,
                ),
              ),
            )
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: ViewReportBody(
        contact: contact,
        details: details,
        img: img,
        sender: sender,
        type: type,
      ),
    );
  }
}

class ViewReportBody extends StatefulWidget {
  final String? details;
  final String? img;
  final String? sender;
  final String? type;
  final String? contact;
  const ViewReportBody(
      {Key? key,
      required this.contact,
      required this.details,
      required this.img,
      required this.sender,
      required this.type})
      : super(key: key);

  @override
  _ViewReportBodyState createState() => _ViewReportBodyState(
      details: details, img: img, sender: sender, type: type, contact: contact);
}

class _ViewReportBodyState extends State<ViewReportBody> {
  final String? details;
  final String? img;
  final String? sender;
  final String? type;
  final String? contact;
  _ViewReportBodyState(
      {required this.contact,
      required this.details,
      required this.img,
      required this.sender,
      required this.type});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
              color: Color(0xffBA0F30),
              child: SizedBox(
                width: 400,
                height: 80,
                child: Center(
                  child: Text(
                    '$type EMERGENCY',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              )),
          firstRow(),
          secondRow(details),
          thirdRow(sender),
          thirdRowv2(contact),
          fourthRow(img),
          buttons(context),
        ],
      ),
    );
  }
}

Widget firstRow() => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Container(
            child: Text('Location:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 10, 5),
          child: Container(
            child: Image(
              image: AssetImage("assets/map.png"),
              fit: BoxFit.cover,
            ),
            height: 200,
            width: 270,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          ),
        )
      ],
    );

Widget secondRow(String? values) => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Container(
            child: Text('Details:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 10, 10, 5),
          child: Container(
            padding: EdgeInsets.all(5),
            height: 100,
            width: 270,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Text(values!),
          ),
        )
      ],
    );

Widget thirdRow(String? name) => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 8),
          child: Container(
            child: Text('Sender:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 15, 10, 5),
          child: Text(
            name!,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );

Widget thirdRowv2(String? contact_num) => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(105, 5, 10, 5),
          child: Text(
            contact_num!,
            style: TextStyle(
              fontSize: 18,
              decoration: TextDecoration.underline,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );

Widget fourthRow(String? imgUrl) => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Container(
            child: Text('Image:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(35, 10, 10, 5),
          child: Container(
              height: 300,
              width: 270,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Image.network(
                imgUrl!,
                fit: BoxFit.fill,
              )),
        )
      ],
    );

Widget buttons(BuildContext context) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 50, 8, 8),
          child: SizedBox(
            height: 45,
            child: ElevatedButton.icon(
              onPressed: () {},
              label: Text(
                'CALL SENDER',
                style: TextStyle(fontSize: 18),
              ),
              icon: Icon(Icons.call),
              style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 50, 8, 8),
          child: SizedBox(
            height: 45,
            child: ElevatedButton.icon(
              label: Text(
                'CONFIRM',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => popUpDialog(context),
                );
              },
              icon: Icon(Icons.check),
            ),
          ),
        )
      ],
    );

Widget popUpDialog(BuildContext context) {
  return AlertDialog(
    backgroundColor: Color(0xffBA0F30),
    contentTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 16,
    ),
    title: Text(
      'REPORT CONFIRMED',
      style: TextStyle(color: Colors.white),
    ),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Please proceed to Dispatch Units'),
      ],
    ),
    actions: [
      TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
          ),
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new DispatchScreen()));
          },
          child: Text('DISPATCH'))
    ],
  );
}
