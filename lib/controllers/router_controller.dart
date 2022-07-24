/*   Hawker Buddy Orbital
 *   Router class used to assign paths to selected page
 */
import 'package:get/get.dart';
import 'package:hawker_buddy/pages/cart/cart_page.dart';
import 'package:hawker_buddy/pages/cart/place_order_page.dart';
import 'package:hawker_buddy/pages/food/Food_details_page.dart';
import 'package:hawker_buddy/pages/food/menu_details_page.dart';
import 'package:hawker_buddy/pages/home/home_Page.dart';
import 'package:hawker_buddy/unused/splash_page.dart';
import 'package:hawker_buddy/unused/login_page.dart';

import '../data/models/cart_data.dart';
import '../unused/signup_page.dart';

class RouterHelper {
  static const String splashPage = "/splash_page";
  static const String initial = '/';
  static const String fooddetails = '/Food-details';
  static const String signupPage = "/signup-page";
  static const String menuPage = '/menu_details';
  //page not done, using dummy duplicate pages
  //static const String PopularHawkerCentre = "/signup-page";
  static const String cartPage = "/cart_page";
  static const String loginPage = "/login_page";
  static const String orderPage = "/order_page";
  static const String test = "/login_page";

  static int pageID = 0;
  static CartData cart = CartData.delete();
  static int initialQuantity = 0;

  static int stallOrders = 0;
  static int foodOrders = 0;
  static bool fromCart = false;
//
  //$use to pass variables
  static String getSplashPage() => splashPage;
  static String getinitial() => initial;
  static String getfooddetails(int foodID) => '$fooddetails?foodID=$foodID';
  //static String getPopularHawkerCentre () => '$PopularHawkerCentre';
  static String getMenu(int pageID) => '$menuPage?pageID=$pageID';
  static String getCartPage() => cartPage;
  static String getLoginPage() => loginPage;
  static String gettest(int test111) => "$test?test = $test111";
  static String geOrderPage(int pgID) => "$orderPage?pgID=$pgID";

  static List<GetPage> routes = [
    //splash Page
    GetPage(
        name: splashPage,
        page: () => const SplashScreen(),
        transition: Transition.fadeIn),

    //HomePage
    GetPage(
        name: initial,
        page: () => const HomePage(),
        transition: Transition.fadeIn),
    //food Details Page
    GetPage(
        name: fooddetails,
        page: () {
          var foodID = Get.parameters['foodID'];
          return FoodDetails(
            foodID: int.parse(foodID!),
            pageId: RouterHelper.pageID,
            count: RouterHelper.initialQuantity,
          );
        },
        transition: Transition.fadeIn),

    //signupPage
    GetPage(
        name: signupPage,
        page: () => const SignUpPage(),
        transition: Transition.fadeIn),

    //MenuPage
    GetPage(
        name: menuPage,
        page: () {
          var pageID = Get.parameters['pageID'];
          RouterHelper.pageID = int.parse(pageID!);
          return MenuPage(pageID: RouterHelper.pageID);
        },
        transition: Transition.fadeIn),

    //CartPage
    GetPage(
        name: cartPage,
        page: () => const CartPage(),
        transition: Transition.fadeIn),

    //LoginPage
    GetPage(
        name: loginPage,
        page: () => const LoginPage(),
        transition: Transition.fadeIn),

    //order Page
    GetPage(
        name: orderPage,
        page: () {
          var orderfoodID = Get.parameters['pgID'];
          return OrderPage(orderpageID: int.parse(orderfoodID!));
        },
        transition: Transition.fadeIn),
  ];
}