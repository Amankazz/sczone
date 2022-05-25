import 'package:flutter/material.dart';
import 'package:sczone/loginTwo/auth_controller.dart';

class WelcomePg extends StatelessWidget {
  String email;
  WelcomePg({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                height: h * 0.3,
                width: w,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          "https://thumbs.dreamstime.com/b/paper-cut-water-abstract-background-banner-d-blue-waves-eco-friendly-design-vector-illustration-layout-business-149785166.jpg",
                        ),
                        fit: BoxFit.cover))),
            SizedBox(height: 70),
            SizedBox(height: 50),
            Container(
              width: w,
              margin: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  Text(
                    email,
                    style: TextStyle(fontSize: 18, color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 200),
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              GestureDetector(
                onTap: () {
                  AuthController.instance.logOut();
                },
                child: Container(
                  height: h * 0.08,
                  width: w * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        // Color(0xfffe53bb),
                        // Color(0xfffe53bb).withOpacity(0.5),
                        // Color(0xFF09FBD3).withOpacity(0.5),
                        // Color(0xFF09FBD3),
                        Colors.indigo,
                        Colors.pinkAccent,
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Sign out',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
