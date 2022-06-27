/*   Hawker Buddy Orbital
 *   Main page with navigation bar
 */


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hawker_buddy/auth_controller.dart';
import 'package:hawker_buddy/pages/cart/cart_page.dart';
import 'package:hawker_buddy/pages/notification/message_page.dart';
import 'package:hawker_buddy/pages/splashes/splash_page.dart';
import 'package:hawker_buddy/pages/user/welcome_page.dart';
import 'package:hawker_buddy/routes/tabNavigator.dart';

import 'Main_Food_Page.dart';
import '../user/login_page.dart';
import 'newHome.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
/*
class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List pages = [
    homepage(),
    MessageApp(),
    CartPage(),
    WelcomePage(email: "Testing1234")
  ];

  void onTapNav(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:pages[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onTapNav,
        items: const [
          BottomNavigationBarItem(icon:Icon(Icons.home),
              label: 'Home',
              backgroundColor: Color(0xFFFF9500)),
          BottomNavigationBarItem(icon: Icon(Icons.message_outlined),
              label: 'Message',backgroundColor: Color(0xFFFF9500)
          ),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),
            label: 'Cart',
            backgroundColor: Color(0xFFFF9500),
          ),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined),
              label: 'Account', backgroundColor: Color(0xFFFF9500)
          ),
        ],
      ),



    );
  }

}
*/



class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  String currentPage = "Page1";
  List<String> pageKeys = ["Page1", "Page2", "Page3", "Page4"];
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Page1": GlobalKey<NavigatorState>(),
    "Page2": GlobalKey<NavigatorState>(),
    "Page3": GlobalKey<NavigatorState>(),
    "Page4": GlobalKey<NavigatorState>(),
  };




  void _selectTab(String tabItem, int index) {
    if(tabItem == currentPage){
      _navigatorKeys[tabItem]?.currentState?.popUntil((route) => route.isFirst);
    }
    else {
      setState(
              () {
            currentPage = pageKeys[index];
            currentIndex = index;
          });
    }
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            await _navigatorKeys[currentPage]!.currentState!.maybePop();
        if(isFirstRouteInCurrentTab) {
          if(currentPage != "Page1"){
            _selectTab("Page1", 1);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
          body: Stack(
            children: <Widget>[
              _buildOffstageNavigator("Page1"),
              _buildOffstageNavigator("Page2"),
              _buildOffstageNavigator("Page3"),
              _buildOffstageNavigator("Page4"),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (int index) {_selectTab(pageKeys[index], index); },
            currentIndex:currentIndex,
            //onTap: (index) => setState(()=> currentIndex = index),
            elevation: 0,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon:Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: Color(0xFFFF9500)),
              BottomNavigationBarItem(icon: Icon(Icons.message_outlined),
                  label: 'Message',backgroundColor: Color(0xFFFF9500)
              ),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),
                label: 'Cart',
                backgroundColor: Color(0xFFFF9500),
              ),
              BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined),
                  label: 'Account', backgroundColor: Color(0xFFFF9500)
              ),


            ],
          )
      ),
    );
  }

  Widget _buildOffstageNavigator(String tabItem){
    return Offstage(
      offstage: currentPage != tabItem,
      child: tabNavi(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }
}
