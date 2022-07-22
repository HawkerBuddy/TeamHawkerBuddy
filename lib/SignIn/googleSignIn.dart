


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hawker_buddy/pages/splashes/splash_page.dart';
import 'package:hawker_buddy/pages/user/login_page.dart';
import 'package:hawker_buddy/routes/router_helper.dart';

class AuthService {

  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if(snapshot.hasData){
            return SplashScreen();
          } else {

            return const LoginPage();
          }

        });
  }

  signInWithGoogle() async{

    //Trigger Authen Flow
    final GoogleSignInAccount? goolgeUser = await GoogleSignIn(
      scopes: <String>["email"]).signIn();

    //Obtain Auth details
    final GoogleSignInAuthentication googleAuth = await goolgeUser!.authentication;

    //create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);

  }

  signOut(){
    FirebaseAuth.instance.signOut();
  }




}