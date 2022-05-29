import 'package:flutter/material.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Scan',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              )),
          TextButton(
              onPressed: () {},
              child: Text(
                'World',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              )),
          TextButton(
              onPressed: () {},
              child: Text(
                'Portal',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
