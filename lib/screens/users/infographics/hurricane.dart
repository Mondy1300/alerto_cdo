import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HurricaneInfoScreen extends StatelessWidget {
  const HurricaneInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HURRICANE'),
        backgroundColor: Colors.blue[400],
      ),
      body: HurricaneInfoBody(),
    );
  }
}

class HurricaneInfoBody extends StatelessWidget {
  const HurricaneInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController _pgcontroller = new PageController();

    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/hurricane/HurricaneBG.png"),
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
                          height: 85,
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
                image: AssetImage('assets/hurricane/H6.png'),
                // height: 150,
              ),
            ),
          ),
        ],
      );
}
