// import 'dart:ffi';
// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:sczone/widgets/cc_back.dart';

import '../widgets/cc_front.dart';
//
/*
class CreditCardPage extends StatefulWidget {
  @override
  State<CreditCardPage> createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage>
    with SingleTickerProviderStateMixin {
  double _rotationFactor = 0;
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();
  AnimationController _flipAnimationController;
  Animation<double> _flipAnimation;
  // FocusNode _cvvFocusNode;

  String _cardNumber = '';
  String _cvvNumber = '';

  _CreditCardPageState() {
    _cardNumberController = TextEditingController();
    _cardNumberController.addListener(() {
      _cardNumber = _cardNumberController.text;
      setState(() {});
    });
    _cvvController.addListener(() {
      _cvvNumber = _cvvController.text;
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();

    _flipAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));
    _flipAnimation =
        Tween<double>(begin: 0, end: 1).animate(_flipAnimationController)
          ..addListener(() {
            setState(() {});
          });
    _flipAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));
    _flipAnimation =
        Tween<double>(begin: 0, end: 1).animate(_flipAnimationController)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credit Card Payment'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(pi * _rotationFactor),
                  origin: Offset(MediaQuery.of(context).size.width / 2, 0),
                  child: _rotationFactor < 0.5
                      ? CcFrontView(cardNumber: _cardNumber)
                      : CcBackView(cvvNumber: _cvvNumber)),
              // Slider(
              //   onChanged: (double value) {
              //     setState(() {
              //       _rotationFactor = value;
              //     });
              //   },
              //   value: _rotationFactor,
              // ),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ], // Only numbers can be entered
                    ),
                    TextField(
                      maxLength: 16,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(hintText: 'Card Number'),
                      controller: _cardNumberController,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Name on card'),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                            flex: 2,
                            child: TextField(
                              decoration:
                                  InputDecoration(hintText: 'Expiry Date'),
                            )),
                        SizedBox(
                          width: 32,
                        ),
                        Expanded(
                            flex: 1,
                            child: TextField(
                              maxLength: 3,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(hintText: 'CVV'),
                              controller: _cvvController,
                            )),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}*/

import 'dart:math' as math;
import 'package:sczone/widgets/cc_front.dart';

import 'package:flutter/material.dart';

class CreditCardPage extends StatefulWidget {
  @override
  _CreditCardPageState createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage>
    with SingleTickerProviderStateMixin {
  double _rotationFactor = 0;
  late AnimationController _flipAnimationController;
  late Animation<double> _flipAnimation;
  late TextEditingController _cardNumberController,
      _cardHolderNameController,
      _cardExpiryController,
      _cvvController;
  late FocusNode _cvvFocusNode;
  String _cardNumber = '';
  String _cardHolderName = '';
  String _cardExpiry = '';
  String _cvvNumber = '';

  _CreditCardPageState() {
    _cardNumberController = TextEditingController();
    _cardHolderNameController = TextEditingController();
    _cardExpiryController = TextEditingController();
    _cvvController = TextEditingController();
    _cvvFocusNode = FocusNode();

    _cardNumberController.addListener(onCardNumberChange);
    _cardHolderNameController.addListener(() {
      _cardHolderName = _cardHolderNameController.text;
      setState(() {});
    });
    _cardExpiryController.addListener(() {
      _cardExpiry = _cardExpiryController.text;
      setState(() {});
    });
    _cvvController.addListener(() {
      _cvvNumber = _cvvController.text;
      setState(() {});
    });

    _cvvFocusNode.addListener(() {
      _cvvFocusNode.hasFocus
          ? _flipAnimationController.forward()
          : _flipAnimationController.reverse();
    });
  }

  @override
  void initState() {
    super.initState();
    _flipAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));
    _flipAnimation =
        Tween<double>(begin: 0, end: 1).animate(_flipAnimationController)
          ..addListener(() {
            setState(() {});
          });
//    _flipAnimationController.forward();
  }

  void onCardNumberChange() {
    _cardNumber = _cardNumberController.text;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            // Positioned(
            //     top: screenHeight * 0.1,
            //     left: -86,
            //     child: Container(
            //       height: 166,
            //       width: 166,
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         color: Color(0xfffe53bb).withOpacity(0.5),
            //       ),
            //       child: BackdropFilter(
            //         filter: ImageFilter.blur(
            //           sigmaX: 200,
            //           sigmaY: 200,
            //         ),
            //         child: Container(
            //           height: 166,
            //           width: 166,
            //           color: Colors.transparent,
            //         ),
            //       ),
            //     )),
            // Positioned(
            //   top: screenHeight * 0.3,
            //   right: -100,
            //   child: Container(
            //     height: 200,
            //     width: 200,
            //     decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       color: const Color(0xFF09FBD3).withOpacity(0.5),
            //     ),
            //     child: BackdropFilter(
            //       filter: ImageFilter.blur(
            //         sigmaX: 200,
            //         sigmaY: 200,
            //       ),
            //       child: Container(
            //         height: 200,
            //         width: 200,
            //         color: Colors.transparent,
            //       ),
            //     ),
            //   ),
            // ),
            SafeArea(
              child: Column(
                children: <Widget>[
                  Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(math.pi * _flipAnimation.value),
                    origin: Offset(MediaQuery.of(context).size.width / 2, 0),
                    child: _flipAnimation.value < 0.5
                        ? CcFrontView(
                            cardNumber: _cardNumber,
                            cardHolderName: _cardHolderName,
                            cardExpiry: _cardExpiry,
                          )
                        : CcBackView(
                            cvvNumber: _cvvNumber,
                          ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      height: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            TextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              controller: _cardNumberController,
                              maxLength: 16,
                              decoration: InputDecoration(
                                hintText: 'Card Number',
                              ),
                            ),
                            TextField(
                              decoration: InputDecoration(hintText: "NAME"),
                              controller: _cardHolderNameController,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: TextField(
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    maxLength: 4,
                                    decoration:
                                        InputDecoration(hintText: "MM/YY"),
                                    controller: _cardExpiryController,
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    maxLength: 3,
                                    decoration: InputDecoration(
                                        counterText: '', hintText: 'CVV'),
                                    focusNode: _cvvFocusNode,
                                    controller: _cvvController,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
