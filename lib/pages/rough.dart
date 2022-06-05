import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:sczone/codetwo/book_detailtwo.dart';
//import '../codetwo/book_detailthree.dart';
import 'package:sczone/pages/Details.dart';
import 'package:sczone/pages/bookCategory.dart';
import 'book_details.dart';
import '../models/book.dart';

String selectedCategorie = "Popular books";

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with TickerProviderStateMixin {
  List<String> categories = ["Popular books", "All", "Genre", "My Books"];

  @override
  Widget build(BuildContext context) {
    final groupbuttoncontroller = GroupButtonController();
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: ListView(
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(left: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          // Icon(
                          //   Icons.book,
                          //   size: 40,
                          //   color: Colors.black,
                          // ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                              child: Text(
                            "Scrizzel",
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: "lovelo",
                            ),
                          )),
                          Spacer(),
                          IconButton(
                              onPressed: () => showSearch(
                                  context: context,
                                  delegate: CustomSearchDelegate()),
                              icon: Icon(Icons.search,
                                  color: Colors.black87, size: 30)),
                          SizedBox(
                            width: 16,
                          ),
                          Icon(Icons.notifications,
                              color: Colors.black87, size: 30),
                        ],
                      ),
                    ),
                    Image.network(
                      "https://raw.githubusercontent.com/theindianappguy/flutterbookapp/master/assets/banner.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),

                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      labelStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      controller: _tabController,
                      isScrollable: true,
                      labelPadding: const EdgeInsets.only(left: 15, right: 15),
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black54,
                      unselectedLabelStyle: TextStyle(fontSize: 18),
                      tabs: [
                        Tab(
                          text: "Popular Books",
                        ),
                        Tab(
                          text: "Genre",
                        ),
                        Tab(
                          text: "My Books",
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 200,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Tab(
                        child: Container(
                          height: 200,
                          child: ListView.builder(
                              itemCount: booklist.books.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return BooksTile(
                                  wideImage: booklist.books[index].cover,
                                  rating: booklist.books[index].rating,
                                  title: booklist.books[index].title,
                                  summary: booklist.books[index].summary,
                                  genre: booklist.books[index].genre,
                                  bookObject: booklist.books[index],
                                );
                              }),
                        ),
                      ),
                      Tab(
                        child: GroupButton(
                          options: GroupButtonOptions(
                            borderRadius: BorderRadius.circular(25),
                            elevation: 2,
                            selectedColor: Color(0xff007084),
                          ),
                          controller: groupbuttoncontroller,
                          buttons: [
                            "Kids",
                            "Education",
                            "Sci-Fi",
                            "Fantacy",
                            "Mystery",
                            "thriller",
                            "Science",
                            "History",
                            "Encyclopedia"
                          ],
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 200,
                          child: ListView.builder(
                              // itemCount: booklist.books.length,
                              itemCount: 2,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return BooksTile(
                                  wideImage: booklist.books[index].cover,
                                  rating: booklist.books[index].rating,
                                  title: booklist.books[index].title,
                                  summary: booklist.books[index].summary,
                                  genre: booklist.books[index].genre,
                                  bookObject: booklist.books[index],
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                /////////////////////////////////////////////////////////////
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: const Text(
                    "Continue Reading",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 270,
                  child: ListView.builder(
                      itemCount: booklist.books.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        String title = booklist.books[index].title.length > 17
                            ? booklist.books[index].title.substring(0, 15) +
                                "..."
                            : booklist.books[index].title;
                        return SingleBookTile(
                          title: title,
                          genre: booklist.books[index].genre,
                          coverImg: booklist.books[index].cover,
                          price: booklist.books[index].price,
                          bookObject: booklist.books[index],
                        );
                      }),
                ),
                //---
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: const Text(
                    "You may also like",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 270,
                  child: ListView.builder(
                      itemCount: booklist.books.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        String title = booklist.books[index].title.length > 17
                            ? booklist.books[index].title.substring(0, 15) +
                                "..."
                            : booklist.books[index].title;
                        return SingleBookTile(
                          title: title,
                          genre: booklist.books[index].genre,
                          coverImg: booklist.books[index].cover,
                          price: booklist.books[index].price,
                          bookObject: booklist.books[index],
                        );
                      }),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: const Text(
                    "Thriller",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 270,
                  child: ListView.builder(
                      itemCount: booklist.books.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        String title = booklist.books[index].title.length > 17
                            ? booklist.books[index].title.substring(0, 15) +
                                "..."
                            : booklist.books[index].title;
                        if (booklist.books[index].genre == "Thriller") {
                          return SingleBookTile(
                            title: title,
                            genre: booklist.books[index].genre,
                            coverImg: booklist.books[index].cover,
                            price: booklist.books[index].price,
                            bookObject: booklist.books[index],
                          );
                        } else {
                          return const SizedBox();
                        }
                      }),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: const Text(
                    "Sci-Fi",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 270,
                  child: ListView.builder(
                      itemCount: booklist.books.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        String title = booklist.books[index].title.length > 17
                            ? booklist.books[index].title.substring(0, 15) +
                                "..."
                            : booklist.books[index].title;
                        if (booklist.books[index].genre == "Sci-Fi") {
                          return SingleBookTile(
                            title: title,
                            genre: booklist.books[index].genre,
                            coverImg: booklist.books[index].cover,
                            price: booklist.books[index].price,
                            bookObject: booklist.books[index],
                          );
                        } else {
                          return SizedBox();
                        }
                      }),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: const Text(
                    "Horror",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 270,
                  child: ListView.builder(
                      itemCount: booklist.books.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        String title = booklist.books[index].title.length > 17
                            ? booklist.books[index].title.substring(0, 15) +
                                "..."
                            : booklist.books[index].title;
                        if (booklist.books[index].genre == 'Horror') {
                          return SingleBookTile(
                            title: title,
                            genre: booklist.books[index].genre,
                            coverImg: booklist.books[index].cover,
                            price: booklist.books[index].price,
                            bookObject: booklist.books[index],
                          );
                        } else {
                          return SizedBox();
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// Widget buildSearch() => SearchWidget(
//       text: query,
//       hintText: 'Only humans search here',
//       onChanged: searchBook,
//     );
// void searchBook(String query) {
//   final books = booklist.books.where((book) {
//     final titleLower = book.title.toLowerCase();
//     final authorLower = book.author.toLowerCase();
//     final searchLower = query.toLowerCase();
//
//     return titleLower.contains(searchLower) ||
//         authorLower.contains(searchLower);
//   }).toList();
//
//   setState(() {
//     this.query = query;
//     this.books = books;
//   });
// }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'harry',
    'sherlock',
    'george',
    'ring',
    'king',
    'god',
    'code',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
    throw UnimplementedError();
  }
}

class topBar extends StatelessWidget {
  const topBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CategorieTile extends StatefulWidget {
  final String text;
  bool isSelected;
  CategorieTile({required this.text, required this.isSelected});

  @override
  _CategorieTileState createState() => _CategorieTileState();
}

class _CategorieTileState extends State<CategorieTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(right: 12),
              child: Text(
                widget.text,
                style: TextStyle(
                    color: widget.isSelected ? Colors.black87 : Colors.grey,
                    fontWeight:
                        widget.isSelected ? FontWeight.w600 : FontWeight.w400,
                    fontSize: widget.isSelected ? 23 : 18),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            widget.isSelected
                ? Container(
                    height: 5,
                    width: 16,
                    decoration: BoxDecoration(
                        color: Color(0xff007084),
                        borderRadius: BorderRadius.circular(12)),
                  )
                : Container()
          ],
        ));
  }
}

class BooksTile extends StatelessWidget {
  final String wideImage, title, summary, genre;
  final double rating;
  final Book bookObject;
  BooksTile(
      {required this.rating,
      required this.summary,
      required this.title,
      required this.genre,
      required this.wideImage,
      required this.bookObject});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BookDetailBottomSheet(bookObject)));
      },
      child: Container(
        height: 200,
        margin: EdgeInsets.only(right: 10, left: 10),
        alignment: Alignment.bottomLeft,
        child: Stack(
          children: <Widget>[
            Container(
              height: 180,
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(top: 6, bottom: 5),
              child: Container(
                width: MediaQuery.of(context).size.width - 50,
                height: 140,
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                    color: Color(0xffeeebe3),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurStyle: BlurStyle.normal,
                        blurRadius: 2.0,
                        offset: Offset(2, 2),
                      ),
                    ]),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 135,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 215,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              title,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '''"The Little Mermaid" is a 
fairy tale written by the Danish author Hans 
Christian Andersen.''',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            Row(
                              children: <Widget>[
                                RatingBar.builder(
                                    updateOnDrag: false,
                                    allowHalfRating: true,
                                    itemSize: 15,
                                    initialRating: rating,
                                    itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                    onRatingUpdate: (rating) {}),
                                Spacer(),
                                Text(genre,
                                    style: TextStyle(color: Color(0xff007084)))
                              ],
                            )
                          ]),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 200,
              width: 135,
              margin: EdgeInsets.only(top: 6, bottom: 5),
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
                  child: Image.network(
                    wideImage,
                    fit: BoxFit.cover,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleBookTile extends StatelessWidget {
  String title, genre, coverImg;
  double price;
  final Book bookObject;
  SingleBookTile(
      {required this.title,
      required this.genre,
      required this.coverImg,
      required this.price,
      required this.bookObject});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BookDetailBottomSheet(bookObject)));
      },
      child: Container(
          child: Column(children: <Widget>[
        Row(
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
                  height: 180,
                  width: 130,
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
                      child: Image.network(coverImg, fit: BoxFit.fill)),
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
                      fontSize: 14,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  genre,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff007084),
                    fontWeight: FontWeight.w400,
                  ),
                  softWrap: true,
                ),
                SizedBox(
                  height: 5,
                ),
                Text("\$$price",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
            SizedBox(
              width: 15,
            ),
          ],
        )
      ])),
    );
  }
}
