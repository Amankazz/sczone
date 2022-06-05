import 'package:breathing_collection/breathing_collection.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:sczone/models/book.dart';
import 'package:sczone/pages/Details.dart';
import 'package:sczone/pages/homeTwo.dart';
import 'package:sczone/widgets/expandText_widget.dart';
import 'package:sczone/widgets/share_widget.dart';

class PanelWidget extends StatefulWidget {
  final ScrollController controller;
  final Book bookObject;
  const PanelWidget(
      {Key? key, required this.controller, required this.bookObject})
      : super(key: key);
  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.only(bottom: 10, left: 15, right: 15, top: 10),
      controller: widget.controller,
      children: <Widget>[
        SizedBox(
          height: 110,
        ),
        buildHeadText(),
        SizedBox(
          height: 35,
        ),
        buildRatingArea(),
        SizedBox(
          height: 15,
        ),
        buildAboutText(),
        SizedBox(
          height: 15,
        ),
        Text(
          "Content",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Column(
          children: [
            ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: ChaptersView(
                        bookObject: booklist.books[index],
                        chapter: booklist.books[index].chapter,
                      ),
                    )),
          ],
        ),
        TextButton(
            onPressed: () {},
            child: Container(
              height: 20,
              child: Text(
                "Show More",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff3bc8e2),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            )),
        SizedBox(height: 15),
        buildDescriptionText(),
        SizedBox(
          height: 16,
        ),
        Text(
          "About Author",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              height: 70,
              width: 70,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  widget.bookObject.authorImg,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              widget.bookObject.author,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        buildExpandedText(),
        SizedBox(
          height: 8,
        ),
        Divider(
          height: 30,
          thickness: 2,
        ),
        Text(
          "Recommended",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          height: 270,
          child: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              String title = booklist.books[index].title.length > 17
                  ? booklist.books[index].title.substring(0, 15) + "..."
                  : booklist.books[index].title;
              return SingleBookTile(
                title: title,
                genre: booklist.books[index].genre,
                coverImg: booklist.books[index].cover,
                price: booklist.books[index].price,
                bookObject: booklist.books[index],
              );
            },
          ),
        )
      ],
    );
  }

  buildHeadText() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              widget.bookObject.title,
              style: TextStyle(
                fontFamily: "lovelo",
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            "Author - " + widget.bookObject.author,
          ),
        ],
      ),
    );
  }

  buildRatingArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: [
                Icon(
                  Icons.people,
                  color: Colors.black54,
                  size: 55,
                ),
                Text(
                  " 14,256 Explorers",
                  style: TextStyle(color: Colors.black54, fontSize: 18),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(children: <Widget>[
                  Text(
                    widget.bookObject.rating.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  RatingBar.builder(
                      updateOnDrag: false,
                      allowHalfRating: true,
                      itemSize: 25,
                      initialRating: widget.bookObject.rating,
                      itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                      onRatingUpdate: (rating) {}),
                ]),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "(6,256 Ratings) ",
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ],
        ),

        // Row(
        //   children: [
        //     Text(
        //       "(6,256 Ratings) ",
        //       style: TextStyle(color: Colors.black54),
        //     ),
        //     Text(
        //       " 14,256 explorers",
        //       style: TextStyle(color: Colors.black54),
        //     ),
        //   ],
        // ),
        SizedBox(
          height: 30,
        ),
        Column(children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.puzzlePiece,
                color: Colors.black54,
                size: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.bookObject.genre,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Icon(
                FontAwesomeIcons.language,
                color: Colors.black54,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                widget.bookObject.language,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ])
      ],
    );
  }

  buildAboutText() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "About",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          ExpandTextWidget(text: widget.bookObject.summary
              // '''stories.  ''',
              ),
        ],
      ),
    );
  }

  buildExpandedText() {
    return Container(
      child: ExpandTextWidget(text: widget.bookObject.summary
          // '''stories.  ''',
          ),
    );
  }

  buildDescriptionText() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Descripton",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          ExpandTextWidget(text: widget.bookObject.summary
              // '''stories.  ''',
              ),
        ],
      ),
    );
  }
}

class ChaptersView extends StatelessWidget {
  final int chapter;
  final Book bookObject;
  const ChaptersView({
    Key? key,
    required this.bookObject,
    required this.chapter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      borderRadius: BorderRadius.circular(16),
      title: Text(
        "Chapter",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      subtitle: Text(
        "Second Day in town",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      animateTrailing: true,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Icon(
                  FontAwesomeIcons.rocket,
                  size: 30,
                  color: Colors.black87,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Models: 10",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            Column(
              children: [
                Icon(
                  FontAwesomeIcons.doorClosed,
                  size: 30,
                  color: Colors.black87,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Portals: 10",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            Column(
              children: [
                Icon(
                  FontAwesomeIcons.tree,
                  size: 30,
                  color: Colors.black87,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Worlds: 10",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
