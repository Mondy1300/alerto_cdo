import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TornadoInfoScreen extends StatelessWidget {
  const TornadoInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TORNADO'),
        backgroundColor: Colors.blue[400],
      ),
      body: TornadoInfoBody(),
    );
  }
}

class TornadoInfoBody extends StatelessWidget {
  const TornadoInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController _pgcontroller = new PageController();

    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/tornado/BG.png"), fit: BoxFit.cover)),
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
                          height: 65,
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
                image: AssetImage('assets/tornado/Tornado1.png'),
                // height: 150,
              ),
            ),
          ),
        ],
      );
}
