import 'package:flutter/material.dart';

class CcFrontView extends StatelessWidget {
  final String cardNumber;
  final String cardHolderName;
  final String cardExpiry;
  String _formattedCardNumber = "";
  String _formattedExpiryDate = "";

  CcFrontView(
      {Key? key,
      required this.cardHolderName,
      required this.cardNumber,
      required this.cardExpiry})
      : super(key: key) {
    _formattedCardNumber = this.cardNumber.padRight(16, '*');
    _formattedCardNumber = _formattedCardNumber.replaceAllMapped(
        RegExp(r".{4}"), (match) => "${match.group(0)}  ");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 230,
      child: Card(
          color: Color(0xffeeebe3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          margin: EdgeInsets.all((12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                    alignment: Alignment.topRight,
                    child: Image.network(
                      "https://www.freepnglogos.com/uploads/visa-logo-png-image-4.png",
                      height: 60,
                      width: 60,
                    )),
                Text(
                  _formattedCardNumber,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 24,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(color: Colors.black12, offset: Offset(2, 1))
                      ]),
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Card Holder',
                            style: TextStyle(color: Colors.black54),
                          ),
                          Text(
                            cardHolderName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                letterSpacing: 2,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Expiry'),
                        Text(
                          _formattedExpiryDate,
                          style: TextStyle(
                              letterSpacing: 2,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
