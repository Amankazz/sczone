import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPg extends StatefulWidget {
  const ForgotPg({Key? key}) : super(key: key);

  @override
  State<ForgotPg> createState() => _ForgotPgState();
}

class _ForgotPgState extends State<ForgotPg> {
  final emailControler = TextEditingController();

  @override
  void dispose() {
    emailControler.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailControler.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Password reset link sent! Check your email'),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
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
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.all(5),
            child: RichText(
                text: TextSpan(
              text: "Enter your Email to get password reset link",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
              ),
            )),
          ),
          SizedBox(height: 20),
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
                    controller: emailControler,
                    decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email, color: Colors.deepPurple),
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
              ],
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              // AuthController.instance.login(emailController.text.trim(),
              // passwordController.text.trim());
              passwordReset();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
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
                      'Reset',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ])));
  }
}
