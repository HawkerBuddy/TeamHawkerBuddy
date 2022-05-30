/*   Hawker Buddy Orbital
 *   Main page with navigation bar
 */


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hawker_buddy/pages/user/welcome_page.dart';

import 'Main_Food_Page.dart';
import '../user/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;


  final screens = [
    MainFoodPage(),
    MainFoodPage(),
    MainFoodPage(),
    MainFoodPage(),
    LoginPage(),
    WelcomePage(email: "test123"),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(currentIndex:currentIndex,
          onTap: (index) => setState(()=> currentIndex = index),
          elevation: 0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon:Icon(Icons.home),
                label: 'Home',
                backgroundColor: Color(0xFFFF9500)),
            BottomNavigationBarItem(icon: Icon(Icons.fastfood_sharp),
              label: 'Stalls',
              backgroundColor: Color(0xFFFF9500),
            ),
            BottomNavigationBarItem(icon: Icon(Icons.discount),
                label: 'Deals',
                backgroundColor: Color(0xFFFF9500)
            ),
            BottomNavigationBarItem(icon: Icon(Icons.message_outlined),
                label: 'Message',backgroundColor: Color(0xFFFF9500)
            ),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined),
                label: 'Account', backgroundColor: Color(0xFFFF9500)
            ),


          ],
        )
    );
  }
}
