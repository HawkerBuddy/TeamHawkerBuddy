/*
  Class consist of Google Sign in Functions.
  use for Separation of the different Sign in methods
 */

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hawker_buddy/unused/splash_page.dart';
import 'package:hawker_buddy/unused/login_page.dart';

class AuthService {
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return const SplashScreen();
          } else {
            return const LoginPage();
          }
        });
  }

  signInWithGoogle() async {
    //Trigger Authen Flow
    final GoogleSignInAccount? goolgeUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    //Obtain Auth details
    final GoogleSignInAuthentication googleAuth =
        await goolgeUser!.authentication;

    //create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
