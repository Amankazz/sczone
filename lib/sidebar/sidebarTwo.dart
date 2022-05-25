import 'dart:async';
import 'dart:ffi';
import 'dart:ui';
import 'package:rxdart/rxdart.dart';

import 'package:flutter/material.dart';

class SideBarTwo extends StatefulWidget {
  const SideBarTwo({Key? key}) : super(key: key);

  @override
  State<SideBarTwo> createState() => _SideBarStateTwo();
}

class _SideBarStateTwo extends State<SideBarTwo>
    with SingleTickerProviderStateMixin<SideBarTwo> {
  late AnimationController _animationController;
  late StreamController<bool> isSidebarOpenedStreamController;
  late Stream<bool>? isSidebarOpenedStream;
  late StreamSink<bool> isSidebarOpenedSink;

  final _animatedDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animatedDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
        initialData: false,
        stream: isSidebarOpenedStream,
        builder: (context, isSideBarOpenedAsync) {
          return AnimatedPositioned(
              duration: _animatedDuration,
              top: 0,
              bottom: 0,
              left: isSideBarOpenedAsync.requireData ? 0 : 0,
              right: isSideBarOpenedAsync.requireData ? 0 : w - 40,
              child: Row(children: <Widget>[
                Expanded(
                  child: Stack(children: [
                    Container(
                      color: Colors.indigo,
                    ),
                    Container(
                      height: h * 0.5,
                      width: w,
                      color: Colors.pinkAccent,
                    )
                  ]),
                ),
                Align(
                  alignment: const Alignment(0, -0.9),
                  child: GestureDetector(
                    onTap: () {
                      onIconPressed();
                    },
                    child: Container(
                      width: 35,
                      height: 50,
                      color: Colors.indigo,
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ]));
        });
  }
}
