import 'dart:ui';

import 'package:flutter/material.dart';
import '../models/book.dart';
import 'Details.dart';

class BooksHome extends StatelessWidget {
  const BooksHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
            color: Colors.black87,
            child: Stack(children: [
              Positioned(
                  top: screenHeight * 0.1,
                  left: -86,
                  child: Container(
                    height: 166,
                    width: 166,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xfffe53bb).withOpacity(0.5),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 200,
                        sigmaY: 200,
                      ),
                      child: Container(
                        height: 166,
                        width: 166,
                        color: Colors.transparent,
                      ),
                    ),
                  )),
              Positioned(
                top: screenHeight * 0.3,
                right: -100,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF09FBD3).withOpacity(0.5),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 200,
                      sigmaY: 200,
                    ),
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              ListView(
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                children: const <Widget>[
                  CustomTitleBar(),
                  HorizontalListView(),
                  HotList(),
                ],
              ),
            ])));
  }
}

class CustomTitleBar extends StatelessWidget {
  const CustomTitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Icon(
              Icons.book,
              size: 40,
              color: Colors.white,
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
                child: Text(
              "Scrizzel",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: "lovelo",
              ),
            ))
          ],
        ));
  }
}

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.transparent,
                Colors.transparent
              ], //colors: [Color(0xfff8f8f8), Colors.white],
            ),
            border: Border(
                bottom: BorderSide(
              color: Colors.transparent, //color: Color(0xfff0f0f0),
              width: 2,
            ))),
        padding: EdgeInsets.only(left: 1.0, right: 1.0, bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 270,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: ClampingScrollPhysics(),
                itemCount: booklist.books.length,
                itemBuilder: (BuildContext context, int i) {
                  if (booklist.books[i].franchise) {
                    return ShowCase(
                      wideImage: booklist.books[i].wideImage,
                      bookObject: booklist.books[i],
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(
              "BEST SELLER",
              style: TextStyle(
                letterSpacing: 1.5,
                color: Colors.white,
              ),
            ),
            Divider(
              color: Colors.white,
            ),
            Text(
              "Novels with a popular franchise",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 30),
              softWrap: true,
            )
          ],
        ));
  }
}

class ShowCase extends StatelessWidget {
  const ShowCase({
    required this.wideImage,
    required this.bookObject,
  });

  final String wideImage;
  final Book bookObject;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Details(bookObject)));
      },
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 15,
          ),
          Container(
            height: 250,
            width: 175,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurStyle: BlurStyle.outer,
                    blurRadius: 5.0,
                    offset: Offset(6, 1.5),
                  ),
                  BoxShadow(
                    color: Colors.black54,
                    blurStyle: BlurStyle.normal,
                    blurRadius: 7.0,
                    offset: Offset(8, 2),
                  ),
                ]),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: Image.network(wideImage, fit: BoxFit.fill)),
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
    );
  }
}

class HotList extends StatelessWidget {
  const HotList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.transparent,
              Colors.transparent
            ], // colors: [Color(0xfff8f8f8), Colors.white],
          ),
          border: Border(
            bottom: BorderSide(color: Color(0xfff0f0f0), width: 1),
          ),
        ),
        padding: EdgeInsets.only(left: 1, right: 1, top: 35, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(
                "New Book Hot List",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              height: 320,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: ClampingScrollPhysics(),
                itemCount: booklist.books.length,
                itemBuilder: (BuildContext context, int i) {
                  String title = booklist.books[i].title.length > 17
                      ? booklist.books[i].title.substring(0, 15) + "..."
                      : booklist.books[i].title;

                  if (booklist.books[i].franchise) {
                    return Container();
                  } else {
                    return ShowBooks(
                      bookCoverImg: booklist.books[i].cover,
                      author: booklist.books[i].author,
                      title: title,
                      price: booklist.books[i].price,
                      bookObject: booklist.books[i],
                    );
                  }
                },
              ),
            ),
          ],
        ));
  }
}

class ShowBooks extends StatelessWidget {
  const ShowBooks(
      {required this.bookCoverImg,
      required this.title,
      required this.author,
      required this.price,
      required this.bookObject});

  final String bookCoverImg;
  final String author;
  final String title;
  final double price;
  final Book bookObject;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Details(bookObject)));
      },
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 7,
              ),
              Container(
                height: 200,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurStyle: BlurStyle.outer,
                        blurRadius: 5.0,
                        offset: Offset(5, 1.5),
                      ),
                      BoxShadow(
                        color: Colors.black54,
                        blurStyle: BlurStyle.normal,
                        blurRadius: 7.0,
                        offset: Offset(8, 2),
                      ),
                    ]),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: Image.network(bookCoverImg, fit: BoxFit.fill)),
              ),
              SizedBox(
                width: 15,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                author,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
                softWrap: true,
              ),
              SizedBox(
                height: 10,
              ),
              Text("\$ $price",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
