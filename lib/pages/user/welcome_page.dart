import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../SignIn/auth_controller.dart';
import '../../utils/dimensions.dart';


class WelcomePage extends StatelessWidget {

   String email;
   WelcomePage({Key ? key, required this.email}) : super(key: key);

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
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/XINLI4.png"
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: h*0.18),
                  CircleAvatar(
                    //backgroundColor: Colors.pinkAccent,
                    radius: 40,
                    backgroundImage: AssetImage(
                        "assets/images/profile.png"
                    ) ,
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height30,),
            //welcome text
            Container(
              width: w,
              margin: const EdgeInsets.only(left:20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome",
                  style: TextStyle(
                    fontSize: Dimensions.font26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54
                  )),
                  Text(
                      email,
                      style: TextStyle(
                          fontSize: Dimensions.font15,
                          color: Colors.grey,
                      )),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height70,),

            //sign out button
            GestureDetector(
              onTap: () {
                AuthController.instance.logout();
              },
              child: Container(
                width: w*0.5,
                height: 0.09 * h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/images/yellow.png"
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(

                  child: Text(
                    "Sign out",
                    style: TextStyle(
                      fontSize: 33,
                      //fontWeight: FontWeight.bold,
                      color:Colors.black,
                    ),
                  ),
                ),
              ),
            ),

            /*
            GestureDetector(
              onTap: () {
                Get.offAll(() => HomePage());
              },
              child: Text(
                "Home",
                style: TextStyle(
                  fontSize: 30,
                  //fontWeight: FontWeight.bold,
                  color:Colors.black,
                ),
              ),
            ),
            */
            
          ],
        ),
    );
  }
}
