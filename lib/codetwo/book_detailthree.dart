import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:sczone/models/book.dart';

bool isFav = false;

class BookDetailBottomSheet extends StatefulWidget {
  final Book bookObject;

  BookDetailBottomSheet(this.bookObject);

  @override
  State<BookDetailBottomSheet> createState() => _BookDetailBottomSheetState();
}

class _BookDetailBottomSheetState extends State<BookDetailBottomSheet> {
  @override
  void initState() {
    isFav = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: (180 / 2) + 50),
        // color: Color(0xFF737373).withOpacity(0),
        decoration: BoxDecoration(
          // color: Colors.black54.withOpacity(.5),
          image: DecorationImage(
            image: NetworkImage(widget.bookObject.cover),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 7.0, vertical: 0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurStyle: BlurStyle.outer,
                    blurRadius: 7.0,
                  ),
                ],
                color: Color(0xffeeebe3),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: (180 / 2) + 20, left: 16.0, right: 16.0),
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        widget.bookObject.author,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.teal, fontSize: 12.0),
                        softWrap: true,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(
                        widget.bookObject.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontFamily: "lovelo",
                            fontWeight: FontWeight.bold),
                        softWrap: true,
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'DESCRIPTION',
                              style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                child: SingleChildScrollView(
                                    child: Text(
                                  widget.bookObject.summary,
                                  style: GoogleFonts.notoSans(
                                      textStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14.0,
                                    letterSpacing: 0.5,
                                  )),
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: -180 / 2,
              child: Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Container(
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
                      ]),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Image.network(widget.bookObject.cover,
                          fit: BoxFit.fill)),
                ),
              ),
            ),
            Positioned(
              left: 25,
              top: 20,
              child: Icon(Icons.share),
            ),
            Positioned(
              right: 35,
              top: 25,
              // child: GestureDetector(
              //   onTap: () {
              //     setState(() {
              //       isFav = !isFav;
              //     });
              //   },
              //   child: Icon(
              //     isFav ? Icons.favorite : Icons.favorite_border,
              //     color: isFav ? Colors.red : Colors.black87,
              //     size: 30,
              //   ),
              // ),
              child: LikeButton(),
            ),
            Positioned(
              left: 30,
              top: 70,
              child: Container(
                width: 36,
                height: 36,
                child: GestureDetector(
                  child: Image.network(
                      'https://icones.pro/wp-content/uploads/2021/08/icone-amazon-noir.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
