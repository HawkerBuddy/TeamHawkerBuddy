/*
* Class created to store dynamic data
* */

import 'package:get/get.dart';
class Dimensions{
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  //dimensions reference from SE3 height 667 and width is 375
  static double pageView = screenHeight/2.08;
  static double pageViewContainer = screenHeight/3.03;
  static double pageViewTextContainer = screenHeight/7.41;

  static double height5 = screenHeight/133.4;
  static double height10 = screenHeight/66.7;
  static double height15 = screenHeight/44.40;
  static double height20 = screenHeight/33.35;
  static double height30 = screenHeight/22.23;
  static double height45 = screenHeight/14.82;
  static double height50 = screenHeight/13.34;
  static double height60 = screenHeight/11.11;
  static double height70 = screenHeight/9.52;


  static double width10 = screenWidth/37.5;
  static double width15 = screenWidth/25;
  static double width20 = screenWidth/18.75;
  static double width30 = screenWidth/12.5;
  static double width45 = screenWidth/8.33;

  static double font10 = screenHeight/66.67;
  static double font15 = screenHeight/44.46;
  static double font20 = screenHeight/33.35;
  static double font26 = screenHeight/25.65;
  static double font70 = screenHeight/9.52;

  static double radius15 = screenHeight/44.46;
  static double radius20 = screenHeight/33.5;
  static double radius25 = screenHeight/26.68;

  //list view size
  static double ListViewImgSize = screenWidth/3.125;
  static double ListViewTextContSize = screenWidth/3.75;

  //foods
  static double foodImgSize = screenHeight/2.5;

  //icons size
   static double iconSize24 = screenHeight/27.79;
   static double iconSize16 = screenHeight/41.6875;
}
