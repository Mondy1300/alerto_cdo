import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class EarthquakeInfoScreen extends StatelessWidget {
  const EarthquakeInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FLOOD'),
        backgroundColor: Colors.blue[400],
      ),
      body: EarthquakeInfoBody(),
    );
  }
}

class EarthquakeInfoBody extends StatelessWidget {
  const EarthquakeInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController _pgcontroller = new PageController();

    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/earthquake/bgtitle.png"),
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
                        padding: const EdgeInsets.only(left: 10, top: 160),
                        child: SizedBox(),
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
                      padding: const EdgeInsets.only(left: 10, top: 160),
                      child: SizedBox(),
                    ),
                    Expanded(child: during())
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 160),
                      child: SizedBox(),
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
            padding: const EdgeInsets.only(left: 0, top: 10),
            child: Container(
              child: Image(
                image: AssetImage('assets/earthquake/Before.png'),
                // height: 210,
              ),
            ),
          ),
        ],
      );

  Widget during() => ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0, top: 10),
            child: Container(
              child: Image(
                image: AssetImage('assets/earthquake/during.png'),
                // height: 210,
              ),
            ),
          ),
        ],
      );

  Widget after() => ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0, top: 10),
            child: Container(
              child: Image(
                image: AssetImage('assets/earthquake/after.png'),
                // height: 210,
              ),
            ),
          ),
        ],
      );
}
