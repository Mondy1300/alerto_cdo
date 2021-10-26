import 'package:flutter/material.dart';

class DispatchScreen extends StatelessWidget {
  const DispatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text(
                'DISPATCH UNITS',
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 40),
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
      body: DispatchScreenBody(),
    );
  }
}

class DispatchScreenBody extends StatefulWidget {
  const DispatchScreenBody({Key? key}) : super(key: key);

  @override
  _DispatchScreenBodyState createState() => _DispatchScreenBodyState();
}

class _DispatchScreenBodyState extends State<DispatchScreenBody> {
  String dropdownvalue = 'UNIT 1';
  String dropdownvalue2 = 'FIRE';
  var items = ['UNIT 1', 'UNIT 2', 'UNIT 3', 'UNIT 4', 'UNIT 5'];
  var items2 = ['CAR CRASH', 'FIRE', 'FLOOD'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              color: Color(0xffBA0F30),
              width: 400,
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  upperRow(),
                  lowerRow(),
                ],
              )),
          firstRow(context),
          secRow(context),
          locRow(),
          detailsRow(),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: SizedBox(
              height: 50,
              width: 250,
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
          ),
        ],
      ),
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
        'UNIT DISPATCHED!',
        style: TextStyle(color: Colors.white),
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Notification has been succesfully sent to sender'),
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
              Navigator.pop(context);
            },
            child: Text('OK'))
      ],
    );
  }

  Widget firstRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Container(
            child: Text(
              'Unit:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50, top: 20),
          child: Container(
            child: SizedBox(
              width: 100,
              height: 50,
              child: DropdownButton(
                value: dropdownvalue,
                icon: Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                  return DropdownMenuItem<String>(
                      value: items,
                      child: Text(
                        items,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget secRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Container(
            child: Text(
              'Type:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 43, top: 20),
          child: Container(
            child: SizedBox(
              width: 120,
              height: 50,
              child: DropdownButton(
                value: dropdownvalue2,
                icon: Icon(Icons.keyboard_arrow_down),
                items: items2.map((String items2) {
                  return DropdownMenuItem<String>(
                      value: items2,
                      child: Text(
                        items2,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ));
                }).toList(),
                onChanged: (String? newValue2) {
                  setState(() {
                    dropdownvalue2 = newValue2!;
                  });
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}

Widget upperRow() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 25),
          child: Container(
            height: 70,
            width: 70,
            child: Center(
              child: Text(
                '15',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.yellow,
                ),
              ),
            ),
            decoration: new BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.yellow, width: 3)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 25),
          child: Container(
            height: 70,
            width: 70,
            child: Center(
              child: Text(
                '13',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.yellow,
                ),
              ),
            ),
            decoration: new BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.yellow, width: 3)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            height: 70,
            width: 70,
            child: Center(
              child: Text(
                '2',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.yellow,
                ),
              ),
            ),
            decoration: new BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.yellow, width: 3)),
          ),
        )
      ],
    );

Widget lowerRow() => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 53, right: 20, top: 5),
          child: Text(
            'ALL UNITS',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 33, right: 20, top: 5),
          child: Text(
            'AVAILABLE\nUNITS',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 10, top: 5),
          child: Text(
            'DISPATCHED\nUNITS',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        )
      ],
    );

Widget locRow() => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Container(
            child: Text('Location:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 10, 5),
          child: Container(
            height: 200,
            width: 270,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          ),
        )
      ],
    );

Widget detailsRow() => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 17),
          child: Container(
            child: Text('Details:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 10, 5),
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
