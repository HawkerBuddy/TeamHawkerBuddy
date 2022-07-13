import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hawker_buddy/utils/mocklist.dart';
import 'package:hawker_buddy/widgets/expandable_food.dart';

import '../../routes/router_helper.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_column.dart';
import '../../widgets/app_icons.dart';
import '../../widgets/small_text.dart';
import '../../widgets/unique_text.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.foodImgSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            "assets/images/chickenrice.png"
                        )
                    )
                )
                ,)),
          //icons
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                       Get.back();
                      },
                      child: AppIcons(icon: Icons.arrow_back_outlined,size:50)),
                  //View Digital Menu
                  GestureDetector(
                      onTap: (){
                        Get.toNamed(RouterHelper.getCartPage());
                      },
                      child: AppIcons(icon: Icons.shopping_cart,size:50)),
                ],
              )),

          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.foodImgSize -20,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top:Dimensions.height20),
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                        topLeft: Radius.circular(Dimensions.radius20)
                    ),
                    color: Colors.white
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(text: 'Weide Chicken rice Store',),
                      SizedBox(height:Dimensions.height10),
                      uniqueText(text: "About us",size:20),
                      SizedBox(height:Dimensions.height10),
                      ExpandableFood(text: "Founded since 1969, recipt was gifted by an angle, taste so good that you can never live without"),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          //10 dummy datas;
                          itemCount: 10,
                          itemBuilder: (context,index){
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(RouterHelper.getPopularHawkerCentre());
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: Dimensions.width20, bottom: Dimensions.height10),
                                child: Row(
                                  children: [
                                    //image section
                                    Container(
                                      width:Dimensions.ListViewImgSize,
                                      height:Dimensions.ListViewImgSize,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                                          color: Colors.white,
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  "assets/images/" + mocklist.slider_images[index]
                                              )
                                          )
                                      ),
                                    ),

                                    //text container
                                    Expanded(
                                      child: Container(
                                        height:Dimensions.ListViewTextContSize,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(Dimensions.radius20),
                                              bottomRight: Radius.circular(Dimensions.radius20)
                                          ),
                                          color: Colors.white38,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: Dimensions.width10),
                                          child: Column(

                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [

                                              uniqueText(text: "Chicken bro"),
                                              SizedBox(height: Dimensions.height10),
                                              miniText(text:"Founded 1999 "),
                                              SizedBox(height: Dimensions.height10),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text("100% Chicken"),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ),

              )),
          

        ],
      ),
    );
  }
}