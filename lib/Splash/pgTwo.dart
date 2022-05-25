import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = LiquidController();

  final pages = [
    Container(
      color: Colors.black87,
      child: const Center(
        child: Text(
          "Page1",
          style: TextStyle(
              fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    ),
    Container(
      color: Colors.greenAccent,
      child: const Center(
        child: Text(
          "Page2",
          style: TextStyle(
              fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    ),
    Container(
      color: Colors.blue,
      child: const Center(
        child: Text(
          "Page3",
          style: TextStyle(
              fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    ),
    Container(
      color: Colors.pinkAccent,
      child: const Center(
        child: Text(
          "Page4",
          style: TextStyle(
              fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  ];

  // const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
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
              child: Row(
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
                          page: page > pages.length ? 0 : page, duration: 600);
                    },
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
