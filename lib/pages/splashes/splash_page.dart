/**
 * Loading Screen
 */

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hawker_buddy/routes/router_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  
  late Animation<double> animation;
  late AnimationController controller;
  
  @override
  void initState(){
    super.initState();
    //init animation controller and created object and use dot operator calling inner class method
    controller = AnimationController(vsync: this, duration: Duration(seconds: 2))..forward();
    //type of animation
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    //delay function
    Timer(
      Duration(seconds: 3),
        ()=>Get.offNamed(RouterHelper.getinitial())
    );
  }

  @override
  dispose() {
    controller.dispose(); // you need this
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          ScaleTransition(scale: animation,
          child: Center(child: Image.asset("assets/images/logo.png"))),
      ],
      ),
      
    );
  }
}
