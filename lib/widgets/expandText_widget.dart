import 'package:flutter/material.dart';

class ExpandTextWidget extends StatefulWidget {
  final String text;
  const ExpandTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  _ExpandTextWidgetState createState() => _ExpandTextWidgetState();
}

class _ExpandTextWidgetState extends State<ExpandTextWidget> {
  late String firstHalf;
  late String? secondHalf;
  bool flag = true;
  @override
  void initState() {
    super.initState();
    if (widget.text.length > 150) {
      firstHalf = widget.text.substring(0, 150);
      secondHalf = widget.text.substring(151, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = " ";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf?.length == ""
          ? Text(widget.text)
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  flag ? firstHalf : widget.text,
                  style: TextStyle(fontSize: 15.5),
                ),
                SizedBox(
                  height: 3,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                  child: flag
                      ? Row(
                          children: [
                            Text(
                              "Show more",
                              style: TextStyle(
                                fontSize: 15.5,
                                color: Color(0xff3bc8e2),
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xff3bc8e2),
                            )
                          ],
                        )
                      : Row(
                          children: [
                            Text(
                              "Show less",
                              style: TextStyle(
                                fontSize: 15.5,
                                color: Color(0xff3bc8e2),
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_up,
                              color: Color(0xff3bc8e2),
                            )
                          ],
                        ),
                )
              ],
            ),
    );
  }
}
