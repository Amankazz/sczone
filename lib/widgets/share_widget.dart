import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ShareButton extends StatefulWidget {
  const ShareButton({Key? key}) : super(key: key);

  @override
  _ShareButtonState createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton> {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: Color(0xffeeebe3).withOpacity(.8),
      direction: SpeedDialDirection.down,
      overlayColor: Colors.black87,
      spaceBetweenChildren: 8,
      buttonSize: Size(45, 45),
      childrenButtonSize: Size(45, 45),
      switchLabelPosition: true,
      icon: Icons.share,
      children: [
        SpeedDialChild(
          child: Icon(Icons.mail),
          label: 'Mail',
          onTap: () => showToast('Selected Mail...'),
        ),
        SpeedDialChild(
          child: Icon(Icons.copy),
          label: 'Copy',
          onTap: () => showToast('Link copied..!'),
        ),
        SpeedDialChild(
          child: Icon(FontAwesomeIcons.facebook),
          label: 'Facebook',
          onTap: () => showToast('Selected Facebook!'),
        )
      ],
    );
  }

  Future showToast(String message) async {
    await Fluttertoast.cancel();
    Fluttertoast.showToast(msg: message, fontSize: 18);
  }
}
