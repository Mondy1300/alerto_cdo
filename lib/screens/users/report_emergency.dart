import 'package:flutter/material.dart';

class ReportEmergency extends StatelessWidget {
  const ReportEmergency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                'REPORT EMERGENCY',
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
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
      body: ReportScreen(),
    );
  }
}

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  var items = ['CAR CRASH', 'FIRE', 'FLOOD'];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: Color(0xffBA0F30),
            child: SizedBox(
              width: 400,
              height: 104,
              child: InputDecorator(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
                  labelText: 'SELECT EMERGENCY',
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                child: DropdownButton<String>(
                  value: value,
                  dropdownColor: Color(0xffBA0F30),
                  items: <String>['CAR CRASH', 'FIRE', 'FLOOD']
                      .map(builMenuItem)
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      this.value = value!;
                    });
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Container(
              height: 200,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
            child: Container(
              height: 150,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
            ),
          ),
          FloatingActionButton.extended(
            icon: Icon(Icons.image),
            onPressed: () {},
            label: Text('Upload Image'),
          ),
          bottomRow(),
        ],
      ),
    );
  }

  DropdownMenuItem<String> builMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      );

  Widget bottomRow() => Row(
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
                  'VOICE CALL',
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
                  'SUBMIT',
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
        'REPORT SUCCESFULLY SENT',
        style: TextStyle(color: Colors.white),
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Please wait for Confirmation'),
        ],
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
            },
            child: Text('OK'))
      ],
    );
  }
}
