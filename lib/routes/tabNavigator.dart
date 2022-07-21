import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawker_buddy/data/stallDetails.dart';
import 'package:hawker_buddy/data_controller.dart';
import 'package:hawker_buddy/pages/home/newHome.dart';
import 'package:hawker_buddy/pages/home/stallsPage.dart';
import 'package:hawker_buddy/pages/user/welcome_page.dart';
import '../pages/cart/cart_page.dart';
import '../pages/home/home_Page.dart';
import '../pages/notification/message_page.dart';
import '../pages/user/login_page.dart';

class tabNavi extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  const tabNavi({Key? key, required this.navigatorKey, required this.tabItem}) : super(key: key);

  @override
  State<tabNavi> createState() => _tabNaviState();
}

class _tabNaviState extends State<tabNavi> {

  @override
  Widget build(BuildContext context) {
    Widget child = stallsPage();

    if(widget.tabItem == "Page1")
      child = homepage();
    else if(widget.tabItem == "Page2")
      child = MessageApp();

    else if(widget.tabItem == "Page3") {
      getData();
      for(int x = 0; x< DataController.OrderStallName.length; x++){
        print(DataController.OrderStallName[x]);
      }
      //sleep(Duration(milliseconds: 20));
      child = CartPage();
    }
    else if(widget.tabItem == "Page4")
      child = WelcomePage(email: "SF1234@gmail.com");
      return Container(
        child: child,
      );
    }

    Future<void> getData() async {
    textStallYIH ab = textStallYIH(index: 0);
    DataController.OrderStallID = await ab.orderGetStallID();
    DataController.OrderStallName = await ab.orderGetStallName();
    DataController.OrderStallImgUrl = await ab.orderGetStallUrl();
    DataController.OrderFoodName = await ab.orderfoodName(DataController.OrderStallID);
    DataController.OrderFoodURl = await ab.orderfoodUrl(DataController.OrderStallID);
    DataController.OrderFoodDes = await ab.orderfoodDes(DataController.OrderStallID);
    DataController.OrderFoodSize = await ab.orderfoodSize(DataController.OrderStallID);
    }
}

