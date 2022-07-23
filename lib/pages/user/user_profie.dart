import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hawker_buddy/utils/colors.dart';
import '../../controllers/auth_controller.dart';
import '../../utils/dimensions.dart';

class WelcomePage extends StatelessWidget {
  String email;
  WelcomePage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          //first image
          Container(
            width: w,
            height: 0.3 * h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/XINLI4.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: h * 0.18),
                CircleAvatar(
                    //backgroundColor: Colors.pinkAccent,
                    radius: Dimensions.radius10 * 4,
                    backgroundImage:
                        CachedNetworkImageProvider(AuthController.img!)),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.height30,
          ),
          //welcome text
          Container(
            width: w,
            margin: EdgeInsets.only(left: Dimensions.width20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome",
                    style: TextStyle(
                        fontSize: Dimensions.font26,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black)),
                Text(email,
                    style: TextStyle(
                      fontSize: Dimensions.font15,
                      color: AppColors.grey,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.height70,
          ),

          //sign out button
          GestureDetector(
            onTap: () {
              AuthController().signOut(); //AuthController.instance.logout();
              AuthController().handleAuthState();
            },
            child: Container(
              width: w * 0.5,
              height: 0.09 * h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                image: const DecorationImage(
                  image: AssetImage("assets/images/yellow.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  "Sign out",
                  style: TextStyle(
                    fontSize: Dimensions.font10 * 3.6,
                    //fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
