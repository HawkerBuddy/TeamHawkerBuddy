import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hawker_buddy/utils/colors.dart';
import 'package:hawker_buddy/utils/dimensions.dart';
import 'package:hawker_buddy/widgets/app_column.dart';
import 'package:hawker_buddy/widgets/app_icons.dart';
import 'package:hawker_buddy/widgets/expandable_food.dart';


import '../../routes/router_helper.dart';
import '../../widgets/unique_text.dart';

class FoodDetails extends StatefulWidget {
  FoodDetails({Key? key}) : super(key: key);

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
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
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.foodImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/images/mala.png"
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: 'Super Spicy Mala '),
                    SizedBox(height: Dimensions.height10),
                    uniqueText(text: "Food details",size:Dimensions.font20),
                    SizedBox(height: Dimensions.height10),
                    Expanded(child:
                    SingleChildScrollView(child:
                    ExpandableFood(text: "Protein Protien Protein Protien Protein Protien Protein Protien Protein Protien Protein Protien Protein Protien Protein Protien Protein Protien Protein Protien")),
                    ),//ExpandableFood(text: "hi"),
                  ],
                ),

          ))
        ],
      ),

      bottomNavigationBar: Container(
        height: 100,
        padding: EdgeInsets.only(top: Dimensions.height30, left: Dimensions.width20, bottom: Dimensions.width20),
        decoration: BoxDecoration(
          //color: AppColors.iconshopopen,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2)
          )
        ),

        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.width10, bottom: Dimensions.width10, right: Dimensions.width10, left: Dimensions.width10),
              //child: uniqueText(text: 'Self-Pick order', color: Colors.black, size: 15,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Row(
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

              )
            ),
            Container(
              padding: EdgeInsets.only(top: Dimensions.width10, bottom: Dimensions.width10, right: Dimensions.width10, left: Dimensions.width10),
              child: uniqueText(text: '\$'+  (price * count).toString() +'| Add to Cart', color: Colors.black54),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,
              ),
            )
          ],
        ) ,
      ),

    );
  }
}
