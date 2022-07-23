/*   Hawker Buddy Orbital
 *   AuthController Class use to control user data base and linked to firebase
 *   Currently using Google Sign in
 */
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hawker_buddy/pages/home/home_Page.dart';
import 'package:hawker_buddy/pages/user/login_google_page.dart';

//navigating the user to different pages
class AuthController extends GetxController{

  static String? userId;
  static String? userName;
  static String? img;

  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {

          if(snapshot.hasData){
            userId = FirebaseAuth.instance.currentUser!.email;
            userName = FirebaseAuth.instance.currentUser!.displayName;
            img = FirebaseAuth.instance.currentUser!.photoURL;
            return HomePage();
          } else {
            return const LoginGoogle();
          }

        });
  }

  signInWithGoogle() async{

    //Trigger Authentic Flow
    final GoogleSignInAccount? goolgeUser = await GoogleSignIn(
        scopes: <String>["email"]).signIn();

    if(goolgeUser !=null) {
      //Obtain Auth details
      final GoogleSignInAuthentication googleAuth = await goolgeUser
          .authentication;

      //create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
  }


  signOut(){
    FirebaseAuth.instance.signOut();
  }
  /*
  //able to reference from all pages
  //static AuthController instance = Get.find();
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
   _initialScreen(User? user){
    //nobody is  not logged in
    if(user == null) {
      print("login page");
      Get.offAll(() => LoginPage());
    } else {
      username = user.email!;
        userId = auth.currentUser!.uid;
        print("user id: " + auth.currentUser!.uid);
      Get.offAll(() => SplashScreen());
      //Get.offAll(() => Test1());
    }
  }
  void register (String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.redAccent, snackPosition: SnackPosition.BOTTOM,
          titleText: Text("Acount creation failed",
              style: TextStyle(
                  color: Colors.white
              )),
          messageText: Text(e.toString(),
              style: TextStyle(
                  color: Colors.white
              )
          )
      );
    }
  }
  void login (String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.redAccent, snackPosition: SnackPosition.BOTTOM,
          titleText: Text("Login creation failed",
              style: TextStyle(
                  color: Colors.white
              )),
          messageText: Text(e.toString(),
              style: TextStyle(
                  color: Colors.white
              )
          )
      );
    }
  }
  void logout() async {
    await auth.signOut();
  }

   */
}
