import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hawker_buddy/pages/home/home_Page.dart';
import 'package:hawker_buddy/pages/home/newHome.dart';
import 'package:hawker_buddy/widgets/small_text.dart';
import 'package:hawker_buddy/widgets/unique_text.dart';

import '../../routes/router_helper.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icons.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  int count = 0;
  double price = 2.5;
  void _increase() {
    setState(()
    { count++;
    });

  }
  void _decrease() {
    if(count<1) {
      return;
    }

    setState(() {
      count--;
    });

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        if(Get.previousRoute == RouterHelper.initial) {
                          //Get.to(HomePage());
                        }
                        else {
                          Get.back();
                        }
                      },
                      child: AppIcons(icon: Icons.arrow_back_outlined,size:50)),
                  //View Digital Menu
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(RouterHelper.initial);
                      },
                      child: AppIcons(icon: Icons.home,size:50,)),
                  AppIcons(icon: Icons.shopping_cart,size:50),
                ],
              )),
          Positioned(
              top:Dimensions.height20 * 5,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child:
          Container(
            //color: Colors.blue,
            margin: EdgeInsets.only(top: Dimensions.height10),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (_, index){
                    return Container(
                      height: 100,
                      width: double.maxFinite,

                      child: Row(
                        children: [
                          Container(
                            width: Dimensions.height20*5,
                            height: Dimensions.height20*5,
                            margin: EdgeInsets.only(bottom: Dimensions.height10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  "assets/images/mala.png"
                                )
                              ),
                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: Dimensions.width10),
                          Expanded(child: Container(
                            height: Dimensions.height20*5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                uniqueText(text: "Mala"),
                                miniText(text: "Super"),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   uniqueText(text: "\$" + (price * count).toString(),color: Colors.redAccent,size: Dimensions.font15,),
                                   Container(

                                     height: Dimensions.height50,
                                     padding: EdgeInsets.only(top: Dimensions.width10, left: Dimensions.width20, bottom: Dimensions.width20, right: Dimensions.width10),
                                     decoration: BoxDecoration(
                                       //color: AppColors.iconshopopen,
                                         borderRadius: BorderRadius.only(
                                             topLeft: Radius.circular(Dimensions.radius20*2),
                                             topRight: Radius.circular(Dimensions.radius20*2)
                                         )
                                     ),

                                     child:Row(
                                       children: [
                                                 GestureDetector(
                                                     onTap:(){
                                                       _decrease();
                                                     },
                                                     child: Container(child: Icon(Icons.remove, color: Colors.grey,))),
                                                 SizedBox(width: Dimensions.width10/2),
                                                 uniqueText(text: count.toString()),
                                                 SizedBox(width: Dimensions.width10/2),
                                                 GestureDetector(
                                                     onTap: (){
                                                       _increase();
                                                     },
                                                     child: Container(child: Icon(Icons.add,color: Colors.grey,)))


                                       ],
                                     ) ,
                                   ),


                                 ],
                                )

                              ],
                            ),
                          ))
                        ],
                      ),

                    );
                  }),
            ),

          ))
        ],
      ),
    );
  }
}
