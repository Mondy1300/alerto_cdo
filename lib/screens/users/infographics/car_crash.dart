import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarCrashInfoScreen extends StatelessWidget {
  const CarCrashInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CAR CRASH'),
        backgroundColor: Colors.blue[400],
      ),
      body: CarCrashInfoBody(),
    );
  }
}

class CarCrashInfoBody extends StatelessWidget {
  const CarCrashInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController _pgcontroller = new PageController();

    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/car_crash/CARBG.png"),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            PageView(
              controller: _pgcontroller,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 150),
                        child: SizedBox(
                          height: 105,
                        ),
                      ),
                      Expanded(
                        child: pics(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget pics() => ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0, top: 10),
            child: Container(
              child: Image(
                image: AssetImage('assets/car_crash/C8.png'),
                // height: 150,
              ),
            ),
          ),
        ],
      );
}
