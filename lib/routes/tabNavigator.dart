import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hawker_buddy/pages/home/Main_Food_Page.dart';
import 'package:hawker_buddy/pages/home/newHome.dart';
import '../pages/home/home_Page.dart';
import '../pages/user/login_page.dart';

class tabNavi extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  const tabNavi({Key? key, required this.navigatorKey, required this.tabItem}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Widget child = MainFoodPage();

    if(tabItem == "Page1")
      child = homepage();
    else if(tabItem == "Page2")
      child = MainFoodPage();

    else if(tabItem == "Page3")
      child = homepage();

    else if(tabItem == "Page4")
      child = LoginPage();
      return Container(
        child: child,
      );
    }
  }

