import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawker_buddy/data/models/orders_made.dart';
import 'package:hawker_buddy/pages/home/home_Page.dart';
import 'package:hawker_buddy/widgets/small_text.dart';
import 'package:hawker_buddy/widgets/unique_text.dart';

import '../../controllers/auth_controller.dart';
import '../../data/models/IDdetails.dart';
import '../../controllers/backend_controller.dart';
import '../../controllers/data_controller.dart';
import '../../controllers/router_controller.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class OrderPage extends StatefulWidget {
  int orderpageID;
  OrderPage({Key? key, required this.orderpageID}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    DataController.OrderFoodName[widget.orderpageID]
        .removeWhere((item) => ["", null].contains(item));
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.height20 * 2,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: Container(
                //color: Colors.blue,
                margin: EdgeInsets.only(top: Dimensions.height10),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                      itemCount: DataController
                          .OrderFoodName[widget.orderpageID].length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: Dimensions.height50 * 2,
                          width: double.maxFinite,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  for (int y = 0;
                                      y <
                                          DataController
                                              .PGPFoodName[
                                                  RouterHelper.stallOrders]
                                              .length;
                                      y++) {
                                    if (DataController.OrderFoodName[
                                            widget.orderpageID][index] ==
                                        DataController.PGPFoodName[
                                            RouterHelper.stallOrders][y]) {
                                      RouterHelper.foodOrders = y;
                                    }
                                  }
                                  RouterHelper.pageID =
                                      RouterHelper.stallOrders;
                                  RouterHelper.initialQuantity = DataController
                                      .OrderFoodSize[widget.orderpageID][index];
                                  RouterHelper.fromCart = true;
                                  Get.toNamed(

                                      //bug faced because different orders wrong page opens when editing items
                                      RouterHelper.getfooddetails(
                                          RouterHelper.foodOrders));
                                },
                                child: Container(
                                  width: Dimensions.height20 * 5,
                                  height: Dimensions.height20 * 5,
                                  margin: EdgeInsets.only(
                                      bottom: Dimensions.height10),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: CachedNetworkImageProvider(
                                            DataController.OrderFoodURl[
                                                widget.orderpageID][index])),
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius20),
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: Dimensions.width10),
                              Expanded(
                                  child: SizedBox(
                                height: Dimensions.height20 * 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    uniqueText(
                                        text: DataController.OrderFoodName[
                                            widget.orderpageID][index]),
                                    miniText(
                                        text: DataController.OrderFoodDes[
                                            widget.orderpageID][index]),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        uniqueText(
                                          text:
                                              "Items: ${DataController.OrderFoodSize[widget.orderpageID][index]}",
                                          color: AppColors.iconque,
                                          size: Dimensions.font15,
                                        ),
                                        Container(
                                          height: Dimensions.height50 * 1.25,
                                          width: Dimensions.width45 * 3,
                                          padding: EdgeInsets.only(
                                              top: Dimensions.width10,
                                              left: Dimensions.width20,
                                              bottom: Dimensions.width20,
                                              right: Dimensions.width10),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                      Dimensions.radius20 * 2),
                                                  topRight: Radius.circular(
                                                      Dimensions.radius20 *
                                                          2))),
                                          child: GestureDetector(
                                            onTap: () async {
                                              if (DataController
                                                      .OrderFoodID[
                                                          widget.orderpageID]
                                                      .length ==
                                                  1) {
                                                RouterHelper.cart
                                                    .deleteCartDocument(
                                                        DataController
                                                                .OrderStallID[
                                                            widget
                                                                .orderpageID]);
                                                final LinktoBackends reading =
                                                    LinktoBackends(index: 0);
                                                DataController.OrderStallID =
                                                    await reading
                                                        .orderGetStallID();
                                                DataController.OrderStallName =
                                                    await reading
                                                        .orderGetStallName();
                                                DataController
                                                        .OrderStallImgUrl =
                                                    await reading
                                                        .orderGetStallUrl();
                                                DataController.OrderFoodName =
                                                    await reading.orderfoodName(
                                                        DataController
                                                            .OrderStallID);
                                                DataController
                                                        .HistoryStallName =
                                                    await reading
                                                        .historyStallName();
                                              } else {
                                                RouterHelper.cart
                                                    .deleteFoodDocument(
                                                        DataController.StallsID[
                                                            RouterHelper
                                                                .stallOrders],
                                                        DataController
                                                                    .OrderFoodID[
                                                                widget
                                                                    .orderpageID]
                                                            [index]);
                                              }
                                              Get.to(() => const HomePage());
                                            },
                                            child: Container(
                                              //height: Dimensions.height30,
                                              padding: EdgeInsets.only(
                                                  right: Dimensions.width10,
                                                  left: Dimensions.width10,
                                                  top: Dimensions.height5,
                                                  bottom: Dimensions.height5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.radius20),
                                                color: AppColors.mainColor,
                                              ),
                                              child: Center(
                                                  child: uniqueText(
                                                text: 'Remove',
                                                color: AppColors.black,
                                                size: Dimensions.font15,
                                              )),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ))
                            ],
                          ),
                        );
                      }),
                ),
              )),
          Positioned(
            //top:Dimensions.height20 * 5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              height: Dimensions.height70,
              padding: EdgeInsets.only(
                top: Dimensions.width10,
                bottom: Dimensions.width20,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20 * 2),
                      topRight: Radius.circular(Dimensions.radius20 * 2))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      //height: Dimensions.height30,
                      padding: EdgeInsets.only(
                        right: Dimensions.width10,
                        left: Dimensions.width10,
                        top: Dimensions.height5 / 2,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.mainColor,
                      ),
                      child: Center(
                          child: uniqueText(
                        text: 'Back to Cart',
                        color: AppColors.black,
                        size: Dimensions.font20,
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState() async {
                        IDdetails.time = DateTime.now();
                        DataController.PGPFoodPrice[RouterHelper.stallOrders]
                            .removeWhere((item) => ["", null].contains(item));
                        DataController.PGPFoodName[RouterHelper.stallOrders]
                            .removeWhere((item) => ["", null].contains(item));
                        Orders order = Orders(
                            orderID: IDdetails.orderNumberID(),
                            cartID: AuthController.userId,
                            stallID: DataController
                                .StallsID[RouterHelper.stallOrders],
                            orderTime: IDdetails.timeStamp(),
                            status: 'orders Made',
                            foodPrice: DataController
                                .PGPFoodPrice[RouterHelper.stallOrders],
                            stallName: DataController
                                .PGPStallNames[RouterHelper.stallOrders],
                            totalPrice: 100,
                            foodNames: DataController
                                .PGPFoodName[RouterHelper.stallOrders]);
                        order.addtoCart(order, "hello");
                        order.arrangeDocument();
                        RouterHelper.cart.deleteCartDocument(
                            DataController.OrderStallID[widget.orderpageID]);
                        final LinktoBackends reading = LinktoBackends(index: 0);
                        DataController.OrderStallID =
                            await reading.orderGetStallID();
                        DataController.OrderStallName =
                            await reading.orderGetStallName();
                        DataController.OrderStallImgUrl =
                            await reading.orderGetStallUrl();
                        DataController.OrderFoodName = await reading
                            .orderfoodName(DataController.OrderStallID);
                        DataController.HistoryStallName =
                            await reading.historyStallName();
                      }

                      if (DataController
                          .OrderFoodName[widget.orderpageID].isNotEmpty) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title:
                                      uniqueText(text: "In App Notification"),
                                  content: uniqueText(
                                    text:
                                        " Make Order with ${DataController.OrderStallName[widget.orderpageID]}",
                                    size: Dimensions.font15,
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () => Get.back(),
                                        child: uniqueText(text: 'Cancel')),
                                    TextButton(
                                        child: uniqueText(text: "Confirm"),
                                        onPressed: () async {
                                          setState();
                                          Get.to(() => const HomePage());
                                          sleep(const Duration(seconds: 2));
                                        })
                                  ],
                                ));
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title:
                                      uniqueText(text: "In App Notification"),
                                  content: uniqueText(
                                      text: "Empty Order, Refresh Home Page"),
                                ));
                        Get.to(() => const HomePage());
                      }
                    },
                    child: Container(
                      //height: Dimensions.height30,
                      padding: EdgeInsets.only(
                        right: Dimensions.width10,
                        left: Dimensions.width10,
                        top: Dimensions.height5 / 2,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.mainColor,
                      ),
                      child: Center(
                          child: uniqueText(
                        text: 'Confirm Order',
                        color: AppColors.black,
                        size: Dimensions.font20,
                      )),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
