import 'package:alerto_cdo_v1/screens/admin/dispatch.dart';
import 'package:flutter/material.dart';

class ViewReportScreen extends StatelessWidget {
  const ViewReportScreen({Key? key}) : super(key: key);

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
      body: ViewReportBody(),
    );
  }
}

class ViewReportBody extends StatefulWidget {
  const ViewReportBody({Key? key}) : super(key: key);

  @override
  _ViewReportBodyState createState() => _ViewReportBodyState();
}

class _ViewReportBodyState extends State<ViewReportBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              color: Color(0xffBA0F30),
              child: SizedBox(
                width: 400,
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.only(left: 115, top: 28),
                  child: Text(
                    'FIRE EMERGENCY',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              )),
          firstRow(),
          secondRow(),
          thirdRow(),
          thirdRowv2(),
          fourthRow(),
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
            height: 200,
            width: 270,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          ),
        )
      ],
    );

Widget secondRow() => Row(
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
            child: Text('Gwapo Raymond Dayadaya'),
          ),
        )
      ],
    );

Widget thirdRow() => Row(
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
            'John Doe',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );

Widget thirdRowv2() => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(105, 5, 10, 5),
          child: Text(
            '0935 1234 567',
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

Widget fourthRow() => Row(
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
            height: 100,
            width: 270,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          ),
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
