import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sczone/loginTwo/auth_controller.dart';

import 'login_pg.dart';

class SignupPg extends StatelessWidget {
  const SignupPg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    List images = [
      "https://www.lucabottarostudio.com/wp-content/uploads/2019/05/google_PNG19635.png",
      "https://upload.wikimedia.org/wikipedia/commons/0/05/Facebook_Logo_%282019%29.png",
      "https://www.freepnglogos.com/uploads/twitter-logo-png/twitter-logo-vector-png-clipart-1.png",
    ];

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
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 7,
                                offset: Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon:
                                Icon(Icons.email, color: Colors.deepPurple),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                )),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 7,
                                offset: Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            suffixIcon: Icon(
                              Icons.remove_red_eye,
                              color: Colors.deepPurple,
                            ),
                            prefixIcon:
                                Icon(Icons.password, color: Colors.deepPurple),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                )),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                    SizedBox(height: 50),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            AuthController.instance.register(
                                emailController.text.trim(),
                                passwordController.text.trim());
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
                                'Sign up',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: w * 0.03),
                        RichText(
                          text: TextSpan(
                              text: "Already have an account?",
                              style: TextStyle(
                                  color: Colors.grey[500], fontSize: 16),
                              children: [
                                TextSpan(
                                    text: " Sign In",
                                    style: TextStyle(
                                      color: Colors.indigo,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => Get.to(() => LoginPg()))
                              ]),
                        ),
                        SizedBox(height: w * 0.1),
                        RichText(
                            text: TextSpan(
                          text: "Sign up using one of the following methods",
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 16),
                        )),
                        Wrap(
                          children: List<Widget>.generate(3, (index) {
                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.transparent,
                                child: CircleAvatar(
                                  foregroundColor: Colors.transparent,
                                  radius: 23,
                                  backgroundImage: NetworkImage(images[index]),
                                ),
                              ),
                            );
                          }),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ])));
  }
}
