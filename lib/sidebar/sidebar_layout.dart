import 'package:flutter/material.dart';
import 'package:sczone/pages/homeTwo.dart';
import 'package:sczone/sidebar/sidebar.dart';
import 'package:sczone/sidebar/sidebarTwo.dart';

class SideBarLayout extends StatefulWidget {
  const SideBarLayout({Key? key}) : super(key: key);

  @override
  State<SideBarLayout> createState() => _SideBarLayoutState();
}

class _SideBarLayoutState extends State<SideBarLayout> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        MyHome(),
        SideBar(),
        // SideBarTwo(),
      ],
    );
  }
}
