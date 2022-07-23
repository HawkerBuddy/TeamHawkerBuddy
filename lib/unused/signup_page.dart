import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawker_buddy/controllers/auth_controller.dart';
import 'package:hawker_buddy/unused/googleSignIn.dart';
import 'package:hawker_buddy/unused/login_page.dart';
import '../utils/dimensions.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              //first image
              Container(
                width: w,
                height: 0.3 * h,
                decoration: const BoxDecoration(
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
                    const CircleAvatar(
                      //backgroundColor: Colors.pinkAccent,
                      radius: 40,
                      backgroundImage: AssetImage(
                        "assets/images/profile.png"
                      ) ,
                    ),
                  ],
                ),
              ),
              //bars
              Container(
                margin: const EdgeInsets.only(left:10, right: 10),
                width: w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Dimensions.height30),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow:[
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 7,
                                offset: Offset(1,1),
                                color: Colors.grey.withOpacity(0.3)
                            )]
                      ),
                      child: TextField(
                        controller: emailController,
                        //obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Email Address",
                            prefixIcon: Icon(Icons.email_outlined, color: Colors.orange,),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: const BorderSide(
                                    color: Colors.white,
                                    width: 1.0
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: const BorderSide(
                                    color: Colors.white,
                                    width: 1.0
                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.height20),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow:[
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 7,
                                offset: Offset(1,1),
                                color: Colors.grey.withOpacity(0.3)
                            )]
                      ),
                      child: TextField(
                        controller: passwordController,
                        //obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.password, color: Colors.orange,),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: const BorderSide(
                                    color: Colors.white,
                                    width: 1.0
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: const BorderSide(
                                    color: Colors.white,
                                    width: 1.0
                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.height20),

                    /*
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Sign in to your account",
                          style: TextStyle(
                              fontSize: Dimensions.font20,
                              color:Colors.grey[500]
                          ),
                        ),
                      ],
                    ),
                    */
                  ],
                ),
              ),
              SizedBox(height: Dimensions.height30,),

              //sign in button wraped with gesture detecotr
              GestureDetector(
                onTap: () {
                  //AuthController.instance.register(emailController.text.trim(),passwordController.text.trim());
                },
                child: Container(
                  width: w*0.5,
                  height: 0.09 * h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                      image: AssetImage(
                          "assets/images/yellow.png"
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 33,
                        //fontWeight: FontWeight.bold,
                        color:Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              RichText(text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap= () => Get.back(),
                text: "Have an account?",
                style: TextStyle(
                  fontSize: Dimensions.height20,
                  color: Colors.grey,
                ),
              )),
              SizedBox(height: h * 0.03,),//space
              RichText(text: TextSpan(
                  text: "Sign up using one of the following methods?",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font10,
                  ),
              )),
              GestureDetector(
                onTap: () {
                 //AuthService().handleAuthState();
                },
                child: Wrap(

                  children: List<Widget>.generate(
                      3, (index){
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              backgroundColor: const Color(0x00000000),
                              radius: Dimensions.width20,
                              backgroundImage: const AssetImage(
                                "assets/images/log.png"
                              ),
                  ),
                          ),
                        );
                  }),
                ),
              )
            ],
          ),
        )
    );
  }
}
