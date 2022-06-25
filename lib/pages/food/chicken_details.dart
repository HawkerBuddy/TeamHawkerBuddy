/*   Hawker Buddy Orbital
 *   Example page to display food details(incomplete)
 */


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hawker_buddy/utils/dimensions.dart';
import 'package:hawker_buddy/widgets/app_column.dart';
import 'package:hawker_buddy/widgets/app_icons.dart';
import 'package:hawker_buddy/utils/mocklist.dart';

import '../../routes/router_helper.dart';
import '../../utils/colors.dart';
import '../../widgets/icon_and_text.dart';
import '../../widgets/small_text.dart';
import '../../widgets/unique_text.dart';

class ChickenRice extends StatelessWidget {
  const ChickenRice ({Key? key}) : super(key: key);

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
                        Get.toNamed(RouterHelper.initial);
                      },
                      child: AppIcons(icon: Icons.arrow_back_outlined,size:50)),
                  //View Digital Menu
                  AppIcons(icon: Icons.menu_book,size:50),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: 'Super Chicken rice Store',),
                    uniqueText(text: "About us",size:20),
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
                              margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10),
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
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: Dimensions.width10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            uniqueText(text: "Blk 85 Market"),
                                            SizedBox(height: Dimensions.height10),
                                            miniText(text:"Founded since 1000BC"),
                                            SizedBox(height: Dimensions.height10),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("ChickenRice"),
                                                Text("ChickenRice"),
                                                Text("ChickenRice")
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

              ))

        ],
      ),
      /*
      bottomNavigationBar: Container(
        height: 120,
        padding: EdgeInsets.only(top: Dimensions.height30, left: Dimensions.width20, bottom: Dimensions.width20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20),
            topRight: Radius.circular(Dimensions.radius20)
          )
        ),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.width10, right: Dimensions.width20, left: Dimensions.width10),
              child: uniqueText(text: 'Self-Pick order', color: Colors.black, size: 15,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: const Color(0xFFFF9500),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.width10, left: Dimensions.width20, right: Dimensions.width10),
              child: uniqueText(text: 'Delivery Order', color: Colors.black, size: 15,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: const Color(0xFFFF9500),
              ),
            )
          ],
        ) ,
      ),
      */
    );
  }
}
