import 'dart:ui';
import 'package:breathing_collection/breathing_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:sczone/codetwo/panel_widget.dart';
import 'package:sczone/models/book.dart';
import 'package:sczone/pages/Details.dart';
import 'package:sczone/pages/scan.dart';
import 'package:sczone/widgets/share_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

bool isFav = false;

class BookDetailBottomSheet extends StatefulWidget {
  final Book bookObject;

  BookDetailBottomSheet(this.bookObject);

  @override
  State<BookDetailBottomSheet> createState() => _BookDetailBottomSheetState();
}

class _BookDetailBottomSheetState extends State<BookDetailBottomSheet> {
  static const double fabHeightClosed = 180;
  double fabHeight = fabHeightClosed;
  late ScrollController controller;
  @override
  void initState() {
    isFav = false;
    super.initState();
    controller = ScrollController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  BuildContext get context => super.context;

  @override
  Widget build(BuildContext context) {
    controller = ScrollController();
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final maxh = MediaQuery.of(context).size.height * 0.8;
    final minh = MediaQuery.of(context).size.height * 0.4;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SlidingUpPanel(
            header: slideUpHeader(context),
            backdropEnabled: true,
            minHeight: minh,
            maxHeight: maxh,
            parallaxEnabled: true,
            color: Color(0xffeeebe3),
            borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
            body: Container(
              padding: EdgeInsets.only(top: (180 / 2) + 50),
              // color: Color(0xFF737373).withOpacity(0),
              decoration: BoxDecoration(
                // color: Colors.black54.withOpacity(.5),
                image: DecorationImage(
                  image: NetworkImage(widget.bookObject.cover),
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.black54, BlendMode.darken),
                ),
              ),
            ),
            panelBuilder: (controller) => PanelWidget(
              controller: controller,
              bookObject: widget.bookObject,
            ),
            onPanelSlide: (position) => setState(() {
              final panelMaxScrollExtent = maxh - minh;
              fabHeight = position * panelMaxScrollExtent + fabHeightClosed;
            }),
          ),
          Positioned(
            bottom: fabHeight,
            child: Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Stack(children: [
                Container(
                  height: 180,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffeeebe3),
                        blurStyle: BlurStyle.solid,
                        blurRadius: 3.0,
                        offset: Offset(4, 1.5),
                      ),
                      BoxShadow(
                        color: Colors.black54,
                        blurStyle: BlurStyle.inner,
                        blurRadius: 3,
                        offset: Offset(5, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Image.network(widget.bookObject.cover,
                          fit: BoxFit.fill)),
                ),
                Positioned(
                  left: 35,
                  top: 60,
                  child: BreathingGlowingButton(
                    height: 60,
                    width: 60,

                    // buttonBackgroundColor: Color(0xFF373a49),
                    buttonBackgroundColor: Colors.white.withOpacity(.5),
                    icon: Icons.play_arrow,
                    glowColor: Colors.greenAccent.withOpacity(.9),
                    iconColor: Colors.black,
                    onTap: () {
                      Get.to(ScanPage());
                    },
                  ),
                ),
              ]),
            ),
          ),
          // Positioned(top: 50, left: 15, child: ShareButton()),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShareButton(),
                      LikeButton(size: 35),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      //bottomNavigationBar: BottomBar(widget.bookObject),
    );
  }
}

Widget slideUpHeader(context) => Container(
      alignment: Alignment.centerLeft,
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
        color: Color(0xffeeebe3),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurStyle: BlurStyle.normal,
            blurRadius: 1,
          ),
        ],
      ),
    );

// Widget SlideUpFooter(context) => Scaffold(
//   bottomNavigationBar: ScrollT,
// )

class BottomBar extends StatefulWidget {
  final Book bookObject;

  BottomBar(this.bookObject);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 1.0,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color(0xFFF9F3DF),
            border: Border(
                top: BorderSide(
              color: Colors.black12,
              width: 1,
            ))),
        child: Row(
          children: <Widget>[PriceWidget(widget: widget), AddButton()],
        ),
      ),
    );
  }
}

class AddButton extends StatefulWidget {
  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  String _buttonText = "Add to cart";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 11),
        elevation: 1.0,
        onPressed: () {
          setState(() {
            _addToCart();
          });
        },
        child: Row(
          children: <Widget>[
            Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              _buttonText,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        color: inCart ? Colors.red : Colors.black54,
      ),
    );
  }

  _addToCart() {
    inCart = !inCart;
    _buttonText = (inCart == false) ? "Add to cart" : "Remove from Cart";
  }
}

class PriceWidget extends StatelessWidget {
  const PriceWidget({required this.widget});

  final BottomBar widget;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: "\$" + widget.bookObject.price.toString(),
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: "lovelo",
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                )),
            TextSpan(text: "  "),
            TextSpan(
              text: "\$" + (widget.bookObject.price + 5.45).toString(),
              style: TextStyle(
                  color: Colors.black26,
                  fontSize: 15,
                  decoration: TextDecoration.lineThrough),
            ),
          ],
        ),
      ),
    );
  }
}

// class ScrollToHideWidget extends StatefulWidget {
//   final Widget child;
//   final ScrollController controller;
//   final Duration duration;
//
//   const ScrollToHideWidget(
//       {Key? key,
//       required this.child,
//       required this.controller,
//       this.duration = const Duration(milliseconds: 200)})
//       : super(key: key);
//
//   @override
//   _ScrollToHideWidgetState createState() => _ScrollToHideWidgetState();
// }
//
// class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {
//   bool isVisible = true;
//   @override
//   Widget build(BuildContext context) => AnimatedContainer(
//       duration: widget.duration,
//       height: isVisible ? kBottomNavigationBarHeight : 0,
//       child: widget.child);
// }
