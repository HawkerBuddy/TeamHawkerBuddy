/*   Hawker Buddy Orbital
 *   AuthController Class use to control user data base and linked to firebase
 */
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawker_buddy/pages/home/home_Page.dart';
import 'package:hawker_buddy/pages/home/newHome.dart';
import 'package:hawker_buddy/pages/splashes/splash_page.dart';
import 'package:hawker_buddy/pages/user/login_page.dart';
import 'package:hawker_buddy/pages/user/welcome_page.dart';
import 'package:hawker_buddy/routes/router_helper.dart';

//navigating the user to different pages
class AuthController extends GetxController {
  //able to reference from all pages
  static AuthController instance = Get.find();
  static String? userId;
  //AuthController.instance..

  //init user
  late Rx<User?> user;
  //init firebase object
  FirebaseAuth auth = FirebaseAuth.instance;
  static late String username;

  @override
  void onReady() {
    super.onReady();
    //casting to Rx<User?> type in dart format
    //Rx<User?> (xxx) also allowed
    user = Rx<User?>(auth.currentUser);

    //bind user to the stream and changes with the user, will notify to the app backend from firebased
    user.bindStream(auth.userChanges());

    //takes a listener and a function
    ever(user, _initialScreen);
  }

  _initialScreen(User? user) {
    //nobody is  not logged in
    if (user == null) {
      print("login page");
      Get.offAll(() => homepage());
    } else {
      username = user.email!;
        userId = auth.currentUser!.uid;
        print("user id: " + auth.currentUser!.uid);
      Get.offAll(() => SplashScreen());
    }
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text("Acount creation failed",
              style: TextStyle(color: Colors.white)),
          messageText:
              Text(e.toString(), style: TextStyle(color: Colors.white)));
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text("Login creation failed",
              style: TextStyle(color: Colors.white)),
          messageText:
              Text(e.toString(), style: TextStyle(color: Colors.white)));
    }
  }

  void logout() async {
    await auth.signOut();
  }
}
