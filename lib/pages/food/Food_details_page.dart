import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawker_buddy/controllers/auth_controller.dart';
import 'package:hawker_buddy/controllers/backend_controller.dart';
import 'package:hawker_buddy/controllers/data_controller.dart';
import 'package:hawker_buddy/utils/colors.dart';
import 'package:hawker_buddy/utils/dimensions.dart';
import 'package:hawker_buddy/widgets/app_column.dart';
import 'package:hawker_buddy/widgets/app_icons.dart';
import 'package:hawker_buddy/widgets/expandable_food.dart';

import '../../data/models/cart_data.dart';
import '../../controllers/router_controller.dart';
import '../../widgets/small_text.dart';
import '../../widgets/unique_text.dart';

class FoodDetails extends StatefulWidget {
  int pageId;
  int foodID;
  int count;

  FoodDetails(
      {Key? key,
      required this.pageId,
      required this.foodID,
      required this.count})
      : super(key: key);

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  void _increase() {
    setState(() {
      widget.count++;
    });
  }

  void _decrease() {
    if (widget.count < 1) {
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
                  image: CachedNetworkImageProvider(DataController
                      .PGPFoodImgUrl[widget.pageId][widget.foodID]),
                )),
              )),
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
                      child:
                          AppIcons(icon: Icons.arrow_back_outlined, size: Dimensions.iconSize50)),
                  //View Digital Menu
                  GestureDetector(
                      onTap: () {
                        if (RouterHelper.fromCart) {
                          Get.back();
                          Get.back();
                        } else {
                          Get.back();
                        }
                      },
                      child: RouterHelper.fromCart
                          ? AppIcons(icon: Icons.shopping_cart)
                          : AppIcons(icon: Icons.menu_book, size: Dimensions.iconSize50)),
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.foodImgSize,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                        topLeft: Radius.circular(Dimensions.radius20)),
                    color: AppColors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(
                        text: DataController.PGPFoodName[widget.pageId]
                            [widget.foodID]),
                    SizedBox(height: Dimensions.height10),
                    uniqueText(text: "Food details", size: Dimensions.font20),
                    SizedBox(height: Dimensions.height10),
                    Expanded(
                      child: SingleChildScrollView(
                          child:
                              ExpandableFood(
                                  text: DataController.PGPFoodDes[widget.pageId]
                                      [widget.foodID])),
                    ), //ExpandableFood(text: "hi"),
                  ],
                ),
              ))
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.height50*2,
        padding: EdgeInsets.only(
            top: Dimensions.height30,
            left: Dimensions.width20,
            bottom: Dimensions.width20),
        decoration: BoxDecoration(
            //color: AppColors.iconshopopen,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.only(
                    top: Dimensions.width10,
                    bottom: Dimensions.width10,
                    right: Dimensions.width10,
                    left: Dimensions.width10),
                //child: uniqueText(text: 'Self-Pick order', color: Colors.black, size: 15,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.white,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          _decrease();
                        },
                        child: const Icon(
                          Icons.remove,
                          color: AppColors.grey,
                        )),
                    SizedBox(width: Dimensions.width10 / 2),
                    uniqueText(text: widget.count.toString()),
                    SizedBox(width: Dimensions.width10 / 2),
                    GestureDetector(
                        onTap: () {
                          _increase();
                        },
                        child: const Icon(
                          Icons.add,
                          color: AppColors.grey,
                        ))
                  ],
                )),
            GestureDetector(
              onTap: () async {
                if (widget.count > 0) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: miniText(
                        text: "Adding to The Cart",
                      ),
                      content: miniText(
                          text:
                              "Adding ${DataController.PGPFoodName[widget.pageId][widget.foodID]} from ${DataController.PGPStallNames[widget.pageId]} to Cart"),
                      actions: [
                        TextButton(
                            onPressed: () => Get.back(),
                            child: uniqueText(
                              text: 'Cancel',
                            )),
                        TextButton(
                            child: uniqueText(
                              text: "Confirm",
                            ),
                            onPressed: () async {
                              CartData c1 = CartData(
                                  widget.count,
                                  double.parse(
                                      DataController.PGPFoodPrice[widget.pageId]
                                          [widget.foodID]),
                                  (widget.count *
                                      double.parse(DataController
                                              .PGPFoodPrice[widget.pageId]
                                          [widget.foodID])),
                                  DataController.PGPFoodID[widget.pageId]
                                      [widget.foodID],
                                  AuthController.userId,
                                  DataController.PGPFoodName[widget.pageId]
                                      [widget.foodID],
                                  DataController.StallsID[widget.pageId],
                                  DataController.PGPStallNames[widget.pageId],
                                  DataController.PGPFoodImgUrl[widget.pageId]
                                      [widget.foodID],
                                  DataController.PGPFoodDes[widget.pageId]
                                      [widget.foodID]);
                              RouterHelper.cart = c1;
                              c1.addtoCart(
                                  c1, DataController.StallsUrl[widget.pageId]);
                              LinktoBackends reading = LinktoBackends(index: 0);
                              DataController.OrderStallID =
                                  await reading.orderGetStallID();
                              DataController.OrderStallName =
                                  await reading.orderGetStallName();
                              DataController.OrderStallImgUrl =
                                  await reading.orderGetStallUrl();
                              DataController.OrderFoodName = await reading
                                  .orderfoodName(DataController.OrderStallID);
                              DataController.OrderFoodURl = await reading
                                  .orderfoodUrl(DataController.OrderStallID);
                              DataController.OrderFoodDes = await reading
                                  .orderfoodDes(DataController.OrderStallID);
                              DataController.OrderFoodSize = await reading
                                  .orderfoodSize(DataController.OrderStallID);

                              if (RouterHelper.fromCart) {
                                Get.back();
                              }
                              Get.toNamed(RouterHelper.getMenu(widget.pageId));
                            }),
                      ],
                    ),
                  );
                } else {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: uniqueText(text: "In App Notification"),
                            content: uniqueText(text: "Invalid Order"),
                          ));
                }
              },
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.width10,
                    bottom: Dimensions.width10,
                    right: Dimensions.width10,
                    left: Dimensions.width10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.mainColor,
                ),
                child: uniqueText(
                    text: '\$${(double.parse(DataController.PGPFoodPrice[widget.pageId]
                                    [widget.foodID]) *
                                widget.count)
                            .toStringAsFixed(2)}| Add to Cart',
                    color: Colors.black54),
              ),
            )
          ],
        ),
      ),
    );
  }
}
