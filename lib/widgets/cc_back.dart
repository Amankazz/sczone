import 'dart:math';

import 'package:flutter/material.dart';

class CcBackView extends StatelessWidget {
  final String cvvNumber;

  const CcBackView({Key? key, required this.cvvNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(pi * 1),
        origin: Offset(MediaQuery.of(context).size.width / 2, 0),
        child: Container(
          width: 500,
          height: 230,
          child: Card(
            color: Color(0xffeeebe3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            margin: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 32,
                ),
                Container(
                  height: 50,
                  color: Colors.black87,
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 25,
                            width: 200,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 32,
                          ),
                          Text(
                            cvvNumber,
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 16,
                        color: Colors.black12,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
