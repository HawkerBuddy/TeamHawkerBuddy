
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hawker_buddy/controllers/auth_controller.dart';
import 'package:hawker_buddy/utils/colors.dart';
import 'package:hawker_buddy/utils/dimensions.dart';
import 'package:hawker_buddy/widgets/unique_text.dart';

import '../../unused/googleSignIn.dart';

class LoginGoogle extends StatefulWidget {
  const LoginGoogle({Key? key}) : super(key: key);

  @override
  State<LoginGoogle> createState() => _LoginGoogleState();
}

class _LoginGoogleState extends State<LoginGoogle> {

  @override
  Widget build(BuildContext context) {
    //getting data of the device
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;



    return Scaffold(
      body: Column(
        children: [
          Container(
            width: w,
            height: 1/2 * h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/logo.png"
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(

            child: Text("Hawker Buddy",
                textAlign: TextAlign.center,
                style:TextStyle(fontSize: Dimensions.font26,fontStyle: FontStyle.italic, color: AppColors.mainColor)
            ),

          ),
          Container(

            child: Text("The App Specially made for you",
                textAlign: TextAlign.center,
                style:TextStyle(fontSize: Dimensions.font15,fontStyle: FontStyle.italic, color: Colors.black)
            ),

          ),
          SizedBox(height: Dimensions.height30,),
          //google
          GestureDetector(
            onTap: () {
              AuthController().signInWithGoogle();
            },
            child: Container(
              width: w*0.75,
              height: 0.1 * h,
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/google.png"
                  ),
                  fit: BoxFit.cover,
                ),

              ),
            ),
          ),
          //facebook
          Container(
            width: w*0.73,
            height: 0.11 * h,
            decoration: BoxDecoration(
              //borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/fb.png"
                ),
                //fit: BoxFit.cover,
              ),

            ),
          ),

          //lead to old login and sign up page
          Container(
            width: w*0.73,
            height: 0.09 * h,
            decoration: BoxDecoration(
              //borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/yellow.png"
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                "Sign-in with Email",
                style: TextStyle(
                  fontSize: 30,
                  //fontWeight: FontWeight.bold,
                  color:Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
