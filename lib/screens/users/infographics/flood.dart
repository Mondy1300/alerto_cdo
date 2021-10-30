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
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 160),
                        child: Container(
                          child: Text(
                            'BEFORE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: before(),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 160),
                      child: Container(
                        child: Text(
                          'DURING',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: during())
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 160),
                      child: Container(
                        child: Text(
                          'AFTER',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: after())
                  ],
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

  Widget before() => ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 20),
            child: Container(
              child: Image(
                image: AssetImage('assets/flood/Picture1.png'),
                height: 125,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, top: 10),
            child: Container(
              child: Image(
                image: AssetImage('assets/flood/Picture2.png'),
                height: 140,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 30),
            child: Container(
              child: Image(
                image: AssetImage('assets/flood/Picture3.png'),
                height: 140,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 30),
            child: Container(
              child: Image(
                image: AssetImage('assets/flood/Picture4.png'),
                height: 140,
              ),
            ),
          ),
        ],
      );

  Widget during() => ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 20),
            child: Container(
              child: Image(
                image: AssetImage('assets/flood/Picture6.png'),
                height: 125,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, top: 20),
            child: Container(
              child: Image(
                image: AssetImage('assets/flood/Picture7.png'),
                height: 140,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 30),
            child: Container(
              child: Image(
                image: AssetImage('assets/flood/Picture8.png'),
                height: 140,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 30),
            child: Container(
              child: Image(
                image: AssetImage('assets/flood/Picture9.png'),
                height: 140,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 30, bottom: 20),
            child: Container(
              child: Image(
                image: AssetImage('assets/flood/Picture10.png'),
                height: 140,
              ),
            ),
          ),
        ],
      );

  Widget after() => ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Container(
              child: Image(
                image: AssetImage('assets/flood/Picture11.png'),
                height: 125,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, top: 20),
            child: Container(
              child: Image(
                image: AssetImage('assets/flood/Picture12.png'),
                height: 140,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 30),
            child: Container(
              child: Image(
                image: AssetImage('assets/flood/Picture13.png'),
                height: 140,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 30),
            child: Container(
              child: Image(
                image: AssetImage('assets/flood/Picture14.png'),
                height: 140,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 30, bottom: 20),
            child: Container(
              child: Image(
                image: AssetImage('assets/flood/Picture15.png'),
                height: 140,
              ),
            ),
          ),
        ],
      );
}
