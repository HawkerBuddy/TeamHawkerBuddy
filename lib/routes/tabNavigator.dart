import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hawker_buddy/pages/home/newHome.dart';
import 'package:hawker_buddy/pages/home/stallsPage.dart';
import 'package:hawker_buddy/pages/user/welcome_page.dart';
import '../pages/cart/cart_page.dart';
import '../pages/home/home_Page.dart';
import '../pages/notification/message_page.dart';
import '../pages/user/login_page.dart';

class tabNavi extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  const tabNavi({Key? key, required this.navigatorKey, required this.tabItem}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Widget child = stallsPage();

    if(tabItem == "Page1")
      child = homepage();
    else if(tabItem == "Page2")
      child = MessageApp();

    else if(tabItem == "Page3")
      child = CartPage();

    else if(tabItem == "Page4")
      child = WelcomePage(email: "SF1234@gmail.com");
      return Container(
        child: child,
      );
    }
  }

