import 'package:flutter/material.dart';
import 'package:sczone/models/book.dart';

import 'homeTwo.dart';

class BookCategory extends StatefulWidget {
  const BookCategory({Key? key}) : super(key: key);

  @override
  _BookCategoryState createState() => _BookCategoryState();
}

class _BookCategoryState extends State<BookCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
    );
  }
}
