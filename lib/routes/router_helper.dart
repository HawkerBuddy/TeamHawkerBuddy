/*   Hawker Buddy Orbital
 *   Router class used to assign paths to selected page
 */
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:hawker_buddy/pages/cart/cart_page.dart';
import 'package:hawker_buddy/pages/food/Food_details.dart';
import 'package:hawker_buddy/pages/food/menu_details.dart';
import 'package:hawker_buddy/pages/home/home_Page.dart';
import 'package:hawker_buddy/pages/home/newHome.dart';
import 'package:hawker_buddy/pages/splashes/splash_page.dart';
import 'package:hawker_buddy/pages/user/login_page.dart';

import '../pages/user/signup_page.dart';

class RouterHelper{
  static const String splashPage = "/splash_page";
  static const String initial ='/';
  static const String fooddetails = '/Food-details';
  static const String signupPage = "/signup-page";
  static const String menuPage = '/menu_details';
  //page not done, using dummy duplicate pages
  //static const String PopularHawkerCentre = "/signup-page";
  static const String cartPage = "/cart_page";
  static const String loginPage = "/login_page";

  static const String test = "/login_page";
  static int pageID = 0;

  //$use to pass variables
  static String getSplashPage() => '$splashPage';
  static String getinitial() => '$initial';
  static String getfooddetails(int foodID) => '$fooddetails?foodID=$foodID';
  //static String getPopularHawkerCentre () => '$PopularHawkerCentre';
  static String getMenu(int pageID) => '$menuPage?pageID=$pageID';
  static String getCartPage() => "$cartPage";
  static String getLoginPage()=> "$loginPage";
  static String gettest(int test111)=> "$test?test = $test111";

  static List<GetPage> routes = [

    GetPage(name: splashPage, page: () => SplashScreen() ,transition: Transition.fadeIn),
    GetPage(name: initial, page: () => HomePage(),transition: Transition.fadeIn),

    GetPage(name: fooddetails, page: () {
      var foodID = Get.parameters['foodID'];
      return FoodDetails(foodID: int.parse(foodID!), pageId: RouterHelper.pageID);
      },
        transition:Transition.fadeIn),

    GetPage(name: signupPage, page: () => SignUpPage(),transition: Transition.fadeIn),

    GetPage(name: menuPage, page: () {
      var pageID = Get.parameters['pageID'];
      RouterHelper.pageID = int.parse(pageID!);
      return MenuPage(pageID: RouterHelper.pageID);
      },

        transition:Transition.fadeIn
    ),


    GetPage(name: cartPage, page: ()=> CartPage() ,transition: Transition.fadeIn),

    GetPage(name: loginPage, page: () => LoginPage(), transition: Transition.fadeIn),
  ];


}