import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FloodInfoScreen extends StatelessWidget {
  const FloodInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FLOOD'),
        backgroundColor: Colors.blue[400],
      ),
      body: FloodInfoBody(),
    );
  }
}

class FloodInfoBody extends StatelessWidget {
  const FloodInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController _pgcontroller = new PageController();

    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/flood/Picture17.png"),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            PageView(
              controller: _pgcontroller,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 80, top: 150),
                  child: Container(
                    child: Text(
                      'TEST',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80, top: 150),
                  child: Container(
                    child: Text(
                      'TEST 2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80, top: 150),
                  child: Container(
                    child: Text(
                      'TEST 3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    child: Center(
                  child: SmoothPageIndicator(
                    controller: _pgcontroller,
                    count: 3,
                    effect: WormEffect(),
                    onDotClicked: (index) => _pgcontroller.animateToPage(index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.bounceOut),
                  ),
                ))
              ],
            )
          ],
        ));
  }
}
