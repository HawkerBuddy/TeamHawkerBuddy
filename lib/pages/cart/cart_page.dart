import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawker_buddy/widgets/unique_text.dart';

import '../../controllers/data_controller.dart';
import '../../controllers/router_controller.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
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
                      itemCount: DataController.OrderStallName.length,
                      itemBuilder: (context, index) {
                        if (index >= DataController.OrderStallImgUrl.length) {
                          index = 0;
                        }
                        return Container(
                          height: Dimensions.height50 * 2,
                          width: double.maxFinite,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(RouterHelper.geOrderPage(index));
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
                                        DataController.OrderStallImgUrl[index],
                                      ),
                                    ),
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
                                        text: DataController
                                            .OrderStallName[index]),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        uniqueText(
                                          text: "Self Pick Up",
                                          color: AppColors.iconque,
                                          size: Dimensions.font15,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            for (int x = 0;
                                                x <
                                                    DataController
                                                        .PGPStallNames.length;
                                                x++) {
                                              if (DataController
                                                      .PGPStallNames[x] ==
                                                  DataController
                                                      .OrderStallName[index]) {
                                                //find the actual pageID
                                                RouterHelper.stallOrders = x;
                                              }
                                            }
                                            Get.toNamed(
                                                RouterHelper.geOrderPage(
                                                    index));
                                          },
                                          child: Container(
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
                                                        Dimensions.radius20 *
                                                            2),
                                                    topRight: Radius.circular(
                                                        Dimensions.radius20 *
                                                            2))),
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
                                              child: uniqueText(
                                                text: 'Place Order',
                                                color: AppColors.black,
                                                size: Dimensions.font15,
                                              ),
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
                  left: Dimensions.width30 * 3,
                  bottom: Dimensions.width20,
                  right: Dimensions.width30 * 3),
              decoration: BoxDecoration(
                  //color: AppColors.iconshopopen,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20 * 2),
                      topRight: Radius.circular(Dimensions.radius20 * 2))),

              //place ORDER ICON
              /*
                  child: Container(
                    //height: Dimensions.height30,
                    padding: EdgeInsets.only(right: Dimensions.width10, left: Dimensions.width10,top:Dimensions.height5/2,),
                    child: Center(child: uniqueText(text:'Place Order', color: Colors.black54,size: Dimensions.font20,)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor,
                    ),
                  ),
                  */
            ),
          )
        ],
      ),
    );
  }
}
