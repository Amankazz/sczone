import 'dart:async';
import 'dart:ui';
import 'package:rxdart/rxdart.dart';

import 'package:flutter/material.dart';
import 'package:sczone/loginTwo/auth_controller.dart';
import 'package:sczone/sidebar/menu_item.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  late AnimationController _animationController;
  late StreamController<bool> isSidebarOpenedStreamController;
  late Stream<bool> isSidebarOpenedStream;
  late StreamSink<bool> isSidebarOpenedSink;

  final _animatedDuration = const Duration(milliseconds: 200);

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
            left: isSideBarOpenedAsync.requireData ? -1 : -w,
            right: isSideBarOpenedAsync.requireData ? 90 : w - 35,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Stack(children: [
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            spreadRadius: 2,
                            // color: isSideBarOpenedAsync.requireData
                            //     ? Colors.black87.withOpacity(0.45)
                            //     : Colors.black87.withOpacity(0.2),
                            color: Colors.black87.withOpacity(0.5),
                          )
                        ]),
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 16,
                              sigmaY: 16,
                            ),
                            child: Container(
                              height: h,
                              width: w * .7,
                              decoration: BoxDecoration(
                                color: Colors.black87.withOpacity(.4),
                                // borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  width: 1.5,
                                  color: Colors.white.withOpacity(0.45),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SafeArea(
                        child: Container(
                          width: w * 0.7,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              ListTile(
                                title: Text(
                                  "Aman",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w800),
                                ),
                                subtitle: Text(
                                  "aman@gmail.com",
                                  style: TextStyle(
                                    color: Color(0xFF1BB5FD),
                                    fontSize: 18,
                                  ),
                                ),
                                leading: CircleAvatar(
                                  child: Icon(
                                    Icons.perm_identity,
                                    color: Colors.white,
                                  ),
                                  radius: 40,
                                ),
                              ),
                              Divider(
                                height: 64,
                                thickness: 0.5,
                                color: Colors.white.withOpacity(0.3),
                                indent: 32,
                                endIndent: 32,
                              ),
                              MenuItem(
                                icon: Icons.home,
                                title: "Home",
                              ),
                              MenuItem(
                                icon: Icons.favorite,
                                title: "Wishlist",
                              ),
                              MenuItem(
                                icon: Icons.shopping_basket,
                                title: "My Orders",
                              ),
                              Divider(
                                height: 40,
                                thickness: 0.5,
                                indent: 32,
                                endIndent: 32,
                              ),
                              MenuItem(
                                icon: Icons.settings,
                                title: "Settings",
                              ),
                              GestureDetector(
                                onTap: () {
                                  AuthController.instance.logOut();
                                },
                                child: MenuItem(
                                  icon: Icons.login_outlined,
                                  title: "Logout",
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(16.0),
                              //   child: Column(
                              //       mainAxisAlignment:
                              //           MainAxisAlignment.spaceEvenly,
                              //       children: [
                              //         GestureDetector(
                              //           onTap: () {
                              //             AuthController.instance.logOut();
                              //           },
                              //           child: Container(
                              //             height: h * 0.06,
                              //             width: w * 0.3,
                              //             decoration: BoxDecoration(
                              //               borderRadius:
                              //                   BorderRadius.circular(30),
                              //               gradient: LinearGradient(
                              //                 begin: Alignment.topLeft,
                              //                 end: Alignment.bottomRight,
                              //                 colors: [
                              //                   // Color(0xfffe53bb),
                              //                   // Color(0xfffe53bb).withOpacity(0.5),
                              //                   // Color(0xFF09FBD3).withOpacity(0.5),
                              //                   // Color(0xFF09FBD3),
                              //                   Colors.indigo,
                              //                   Colors.pinkAccent,
                              //                 ],
                              //               ),
                              //             ),
                              //             child: Center(
                              //               child: Text(
                              //                 'Sign out',
                              //                 style: TextStyle(
                              //                     fontSize: 22,
                              //                     color: Colors.white,
                              //                     fontWeight: FontWeight.bold),
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //       ]),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, -0.93),
                  child: GestureDetector(
                    onTap: () {
                      onIconPressed();
                    },
                    child: ClipPath(
                      clipper: CustomMenuClipper(),
                      child: Container(
                        width: 35,
                        height: 80,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            blurRadius: 16,
                            spreadRadius: 5,
                            // color: isSideBarOpenedAsync.requireData
                            //     ? Colors.black87.withOpacity(0.3)
                            //     : Colors.black87.withOpacity(0.1),
                            color: Colors.black87,
                          )
                        ]),
                        child: ClipRRect(
                          // borderRadius: BorderRadius.circular(16),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 16,
                              sigmaY: 16,
                            ),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              height: h,
                              width: w * 0.7,
                              decoration: BoxDecoration(
                                color: Colors.black87.withOpacity(0.3),
                                // borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  width: 1.5,
                                  color: Colors.white.withOpacity(0.3),
                                ),
                              ),
                              child: AnimatedIcon(
                                progress: _animationController.view,
                                icon: AnimatedIcons.menu_close,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
