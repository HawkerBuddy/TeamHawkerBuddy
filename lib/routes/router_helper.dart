/*   Hawker Buddy Orbital
 *   Router class used to assign paths to selected page
 */


import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:hawker_buddy/pages/food/Food_details.dart';
import 'package:hawker_buddy/pages/food/chicken_details.dart';
import 'package:hawker_buddy/pages/home/Main_Food_Page.dart';

import '../pages/user/signup_page.dart';

class RouterHelper{
  static const String initial ='/';
  static const String fooddetails = '/Food-details';
  static const String signupPage = "/signup-page";
  static const String chickenrice = '/Chicken-Rice';
  //page not done, using dummy duplicate pages
  static const String PopularHawkerCentre = "/signup-page";

  //$use as variable
  static String getinitial() => '$initial';
  static String getfooddetails () => '$fooddetails';
  static String getPopularHawkerCentre () => '$PopularHawkerCentre';
  static String getChickenRice () => '$chickenrice';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),
    GetPage(name: fooddetails, page: () {
        return FoodDetails();},
        transition:Transition.fadeIn),
    //dummy page
    GetPage(name: PopularHawkerCentre, page: () {return FoodDetails();},
        transition:Transition.fadeIn),

    GetPage(name: signupPage, page: () => SignUpPage()),

    GetPage(name: chickenrice, page: () {return ChickenRice();},
        transition:Transition.fadeIn),

  ];


}