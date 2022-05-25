import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sczone/extra/glass_morphism.dart';
//import 'package:sczone/login/loginPages/login_page.dart';
import 'Splash/pgOne.dart';
import 'package:sczone/loginTwo/login_pg.dart';
import 'package:sczone/loginTwo/signup_pg.dart';
import 'package:sczone/loginTwo/welcome_pg.dart';
import 'package:sczone/pages/CreditCard.dart';
import 'package:sczone/pages/home.dart';
import 'package:sczone/pages/splashTwo.dart';
import 'package:sczone/pages/homeTwo.dart';
import 'package:sczone/sidebar/sidebar_layout.dart';

import 'loginTwo/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(BooksApp());
}

// void main() {
//   runApp(BooksApp());
// }

class BooksApp extends StatelessWidget {
  const BooksApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BooksApp",
      //home: GlassMorphism(),
      // home: CreditCardPage()
      // home: SplashScreen(title: "BooksApp"),
      // home: MyHome(),
      // home: BooksHome(),
      // home: TheSplah(),
      // home: LoginPage(),
      // home: LoginPg(),
      // home: SideBarLayout(),
      home: SplashScreen(),
    );
  }
}
