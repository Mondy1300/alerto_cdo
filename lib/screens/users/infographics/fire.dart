import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FireInfoScreen extends StatelessWidget {
  const FireInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FIRE'),
        backgroundColor: Colors.blue[400],
      ),
      body: FireInfoBody(),
    );
  }
}

class FireInfoBody extends StatelessWidget {
  const FireInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController _pgcontroller = new PageController();

    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/fire/BG12.png"), fit: BoxFit.cover)),
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
                        child: SizedBox(),
                      ),
                      Expanded(
                        child: before(),
                      ),
                    ],
                  ),
                ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(left: 10, top: 160),
                //       child: SizedBox(
                //         child: Image(
                //           image: AssetImage('assets/flood/during.png'),
                //           height: 50,
                //         ),
                //       ),
                //     ),
                //     Expanded(child: during())
                //   ],
                // ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(left: 20, top: 160),
                //       child: SizedBox(
                //         child: Image(
                //           image: AssetImage('assets/flood/after.png'),
                //           height: 65,
                //         ),
                //       ),
                //     ),
                //     // Expanded(child: after())
                //   ],
                // ),
              ],
            ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     Container(
            //         child: Center(
            //       child: SmoothPageIndicator(
            //         controller: _pgcontroller,
            //         count: 3,
            //         effect: WormEffect(),
            //         onDotClicked: (index) => _pgcontroller.animateToPage(index,
            //             duration: Duration(milliseconds: 500),
            //             curve: Curves.bounceOut),
            //       ),
            //     ))
            //   ],
            // )
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
                image: AssetImage('assets/fire/f1.png'),
                // height: 150,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0, top: 50),
            child: Container(
              child: Image(
                image: AssetImage('assets/fire/f2.png'),
                // height: 150,
              ),
            ),
          ),
        ],
      );
}
