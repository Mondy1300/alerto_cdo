import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LandslideInfoScreen extends StatelessWidget {
  const LandslideInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LANDSLIDE'),
        backgroundColor: Colors.blue[400],
      ),
      body: LanslideInfoBody(),
    );
  }
}

class LanslideInfoBody extends StatelessWidget {
  const LanslideInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController _pgcontroller = new PageController();

    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/landslide/BG.png"),
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
                          height: 50,
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
                image: AssetImage('assets/landslide/pic1.png'),
                // height: 150,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0, top: 50),
            child: Container(
              child: Image(
                image: AssetImage('assets/landslide/pic2.png'),
                // height: 150,
              ),
            ),
          ),
        ],
      );
}
