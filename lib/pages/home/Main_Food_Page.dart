import 'package:flutter/material.dart';
import 'package:hawker_buddy/pages/user/login_page.dart';
import 'package:hawker_buddy/widgets/app_icons.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/unique_text.dart';
import 'food_page_body.dart';


class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {


  @override
  Widget build(BuildContext context) {

    //getting dimensions the easy way grab and apply;
    //print("current height is " + MediaQuery.of(context).size.width.toString());
    return Scaffold(
      //Entire Home page combined in column widget
      body: Column(
        children: [
          // top sections with Search Bar and Search for Hawker Stalls
          Container(
            child: Container(
              color: Colors.blue,
              //margin for the search bar + text
              margin: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height15),
              padding: EdgeInsets.only(left:Dimensions.width20, right: Dimensions.width20),
              child: Row(
                children: [
                  Center(
                    //Seach icon paddings
                    child: Container(
                      width: Dimensions.height45,
                      height: Dimensions.width45,
                      child:Icon(Icons.search, color: AppColors.icon1) ,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),

                  //Insert Text Search for Hawker Stalls
                  Column(
                    children: [
                      //Text("  Search for Hawkers"),
                      uniqueText(text: "  Search for Hawker Stalls")
                    ],
                  ),
                ],
              ),
            ),
          ),

          //include slides and below and link to food_page_body
          Expanded(child: SingleChildScrollView(
            child: Foodpage(),
          )),
          //body Container

        ],
      ),

        //Code for NavigationBar

    );
  }
}
