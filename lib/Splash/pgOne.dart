import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:lottie/lottie.dart';
import 'package:sczone/loginTwo/login_pg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = LiquidController();

  final pages = [
    Container(
      color: Colors.black,
      child: Stack(children: [
        Expanded(
          child: Container(
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Lottie.asset("assets/hfour.json"),
              SizedBox(
                height: 30,
              ),
              const Text(
                "Touch the past, control the future",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
      ]),
    ),
    Container(
      color: Colors.black,
      child: Stack(
        children: [
          //Image.asset("assets/solarsys.png"),
          Expanded(
            child: Container(
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              children: [
                Stack(children: [
                  Image.network(
                    "https://cdn.dribbble.com/users/518045/screenshots/15345672/media/075eef3d9b40a163b5bc5b62b92f5a96.png",
                  ),
                  Lottie.asset(
                    "assets/astronot.json",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 350.0),
                    child: const Text(
                      "Immerse yourself in limitless space and time",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    ),
    Container(
      color: Colors.black,
      child: Stack(children: [
        Expanded(
          child: Container(
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Column(
            children: [
              Lottie.asset("assets/newportaltwo.json"),
              SizedBox(
                height: 50,
              ),
              const Text(
                "Let’s step into a new dimension",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
      ]),
    ),
  ];
  //
  // const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            enableLoop: false,
            liquidController: controller,
            pages: pages,
            enableSideReveal: true,
            onPageChangeCallback: (index) {
              setState(() {});
            },
            slideIconWidget: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 16,
            right: 32,
            child: controller.currentPage != pages.length - 1
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        child: const Text(
                          "SKIP",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          controller.jumpToPage(page: pages.length - 1);
                        },
                      ),
                      AnimatedSmoothIndicator(
                        duration: Duration(milliseconds: 500),
                        activeIndex: controller.currentPage,
                        count: pages.length,
                        effect: const WormEffect(
                          type: WormType.normal,
                          spacing: 16,
                          dotColor: Colors.white54,
                          activeDotColor: Colors.white,
                        ),
                        onDotClicked: (index) {
                          controller.animateToPage(page: index);
                        },
                      ),
                      TextButton(
                        child: const Text(
                          "NEXT",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          final page = controller.currentPage + 1;
                          controller.animateToPage(
                              page: page > pages.length ? 0 : page,
                              duration: 600);
                        },
                      ),
                    ],
                  )
                : TextButton(
                    onPressed: () async {
                      Get.offAll(() => LoginPg());
                    },
                    child: Text(
                      " Explore Now ",
                      style: TextStyle(
                        fontSize: 34,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.lightGreenAccent,
                      ),
                    ),
                  ),
          ),
        ],
      ),
      // bottomSheet: isLastPage ? TextButton(onPressed: () async{}, child: const Text("Get Started", style: TextStyle(fontSize: 24,),),)
    );
  }
}
