import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hawker_buddy/SignIn/auth_controller.dart';
import 'package:hawker_buddy/data/cart_data2.dart';
import 'package:hawker_buddy/data/stallDetails.dart';
import 'package:hawker_buddy/data_controller.dart';
import 'package:hawker_buddy/utils/colors.dart';
import 'package:hawker_buddy/utils/dimensions.dart';
import 'package:hawker_buddy/widgets/app_column.dart';
import 'package:hawker_buddy/widgets/app_icons.dart';
import 'package:hawker_buddy/widgets/expandable_food.dart';


import '../../data/cart_data.dart';
import '../../routes/router_helper.dart';
import '../../widgets/unique_text.dart';

class FoodDetails extends StatefulWidget {
  int pageId;
  int foodID;
  int count;

  FoodDetails({Key? key,required this.pageId, required this.foodID, required this.count}) : super(key: key);

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {


  void _increase() {
    setState(()
    { widget.count++;
        });

  }

  void _decrease() {
    if(widget.count<1) {
      return;
    }

    setState(() {
      widget.count--;
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
                    image: CachedNetworkImageProvider(
                      DataController.PGPFoodImgUrl[widget.pageId][widget.foodID]
                    ),
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
                        Get.back();
                        //Get.toNamed(RouterHelper.getCartPage());
                      },
                      child: AppIcons(icon: Icons.home,size:50)),
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
                    AppColumn(text: DataController.PGPFoodName[widget.pageId][widget.foodID]),
                    SizedBox(height: Dimensions.height10),
                    uniqueText(text: "Food details",size:Dimensions.font20),
                    SizedBox(height: Dimensions.height10),
                    Expanded(child:
                    SingleChildScrollView(child:
                        //DataController.xxxxx[pageID][foodID]
                    ExpandableFood(text: DataController.PGPFoodDes[widget.pageId][widget.foodID])),
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
                  uniqueText(text: widget.count.toString()),
                  SizedBox(width: Dimensions.width10/2),
                  GestureDetector(
                      onTap: (){
                       _increase();
                      },
                      child: Container(child: Icon(Icons.add,color: Colors.grey,)))
                ],

              )
            ),
            GestureDetector(
              onTap: () async {
                /*
                CartData c1 = CartData(count,double.parse(DataController.PGPFoodPrice[widget.pageId][widget.foodID]),
                (count * double.parse(DataController.PGPFoodPrice[widget.pageId][widget.foodID])),"foodID","userID");
                c1.addtoCartindex();
                //c1.addtoCart(c1);
                //c1.addCollection(count.toString());
                */
                CartData c1 = CartData(widget.count,double.parse(DataController.PGPFoodPrice[widget.pageId][widget.foodID])
                    , (widget.count * double.parse(DataController.PGPFoodPrice[widget.pageId][widget.foodID]))
                    ,DataController.PGPFoodID[widget.pageId][widget.foodID]
                    ,AuthController.userId,DataController.PGPFoodName[widget.pageId][widget.foodID]
                    ,DataController.StallsID[widget.pageId], DataController.PGPStallNames[widget.pageId]
                    ,DataController.PGPFoodImgUrl[widget.pageId][widget.foodID]
                    ,DataController.PGPFoodDes[widget.pageId][widget.foodID]);

                RouterHelper.cart = c1;
                c1.addtoCart(c1,DataController.StallsUrl[widget.pageId]);
                //Data is working
                //c1.deleteCartDocument(DataController.StallsID[widget.pageId]);
                //dele docs
                final textStallYIH reading = textStallYIH(index: 0);
                DataController.OrderStallID = await reading.orderGetStallID();
                DataController.OrderStallName = await reading.orderGetStallName();
                DataController.OrderStallImgUrl = await reading.orderGetStallUrl();
                DataController.OrderFoodName = await reading.orderfoodName(DataController.OrderStallID);
                DataController.OrderFoodURl = await reading.orderfoodUrl(DataController.OrderStallID);
                DataController.OrderFoodDes = await reading.orderfoodDes(DataController.OrderStallID);
                DataController.OrderFoodSize = await reading.orderfoodSize(DataController.OrderStallID);
                Get.back();
                //DataController.OrderFoodName[widget.pageId].removeWhere((item) =>["", null].contains(item));

                //c1.addtoCartindex();

                //one more function to send the order to the backend
              },
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.width10, bottom: Dimensions.width10, right: Dimensions.width10, left: Dimensions.width10),
                child: uniqueText(text: '\$'+  (double.parse(DataController.PGPFoodPrice[widget.pageId][widget.foodID]) * widget.count).toString() +'| Add to Cart', color: Colors.black54),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.mainColor,
                ),
              ),
            )
          ],
        ) ,
      ),

    );
  }
}
