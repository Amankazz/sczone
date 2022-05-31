import 'package:breathing_collection/breathing_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(children: [
                  Column(
                    children: [
                      Text(
                        "Scan",
                        style: TextStyle(
                            fontSize: 55,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        height: height / 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Card(
                          color: Colors.black,
                          // child: Lottie.network(
                          //   'https://raw.githubusercontent.com/Amankazz/Flutter_Ui_One/main/hfour.json?token=GHSAT0AAAAAABS7WDYAFL64H6LFP54GOSJ4YUVCBGA',
                          //   fit: BoxFit.fill,
                          // ),
                          child: Lottie.asset("assets/hfour.json"),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 5,
                    left: width * .42,
                    child: BreathingGlowingButton(
                      height: 70,
                      width: 70,
                      icon: FontAwesomeIcons.camera,
                      buttonBackgroundColor: Colors.white.withOpacity(.8),
                      iconColor: Colors.black54,
                    ),
                  ),
                ]),
                SizedBox(
                  height: 10,
                ),

                Stack(children: [
                  Column(
                    children: [
                      Text(
                        "World",
                        style: TextStyle(
                            fontSize: 55,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        height: height / 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Card(
                          shadowColor: Colors.white54,
                          elevation: 5,
                          color: Colors.black,
                          // child: Lottie.network(
                          //   'https://raw.githubusercontent.com/Amankazz/Flutter_Ui_One/main/hfour.json?token=GHSAT0AAAAAABS7WDYAFL64H6LFP54GOSJ4YUVCBGA',
                          //   fit: BoxFit.fill,
                          // ),
                          child: Stack(children: [
                            // Lottie.asset("assets/space.json"),
                            Container(
                              width: width,
                              child: Opacity(
                                opacity: 0.5,
                                child: Image.asset("assets/solarsys.png"),
                              ),
                            ),
                            Image.asset("assets/solarsys.png"),
                            Lottie.asset(
                              "assets/astronot.json",
                            ),
                          ]),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 5,
                    left: width * .42,
                    child: BreathingGlowingButton(
                      height: 70,
                      width: 70,
                      icon: FontAwesomeIcons.mapLocation,
                      buttonBackgroundColor: Colors.white.withOpacity(.8),
                      iconColor: Colors.black54,
                    ),
                  ),
                ]),
                SizedBox(
                  height: 10,
                ),

                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Card(
                    child: Lottie.asset("assets/portalone.json"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                BreathingGlowingButton(
                  icon: FontAwesomeIcons.camera,
                ),
                // TextButton(
                //     onPressed: () {},
                //     child: Text(
                //       'Portal',
                //       style:
                //           TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                //     )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
