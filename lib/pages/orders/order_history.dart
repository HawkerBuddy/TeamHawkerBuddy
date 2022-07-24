import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/data_controller.dart';
import '../../controllers/router_controller.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/unique_text.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    itemCount: DataController.HistoryStallName.length,
                    itemBuilder: (context, index) {
                      if (index >= DataController.HistoryOrderTime.length) {
                        index = 0;
                      }
                      return SizedBox(
                        height: Dimensions.height50 * 2,
                        width: double.maxFinite,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: Dimensions.height20 * 4,
                                height: Dimensions.height20 * 5,
                                margin: EdgeInsets.only(
                                    bottom: Dimensions.height10),
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage("assets/images/logo.png")),
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: Dimensions.width10 / 2),
                            Expanded(
                                child: SizedBox(
                              height: Dimensions.height20 * 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  uniqueText(
                                    text:
                                        DataController.HistoryStallName[index],
                                    size: Dimensions.font15,
                                  ),
                                  //miniText(text: "Order History on"),
                                  SingleChildScrollView(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        uniqueText(
                                          text: DataController
                                              .HistoryOrderTime[index],
                                          color: AppColors.blue,
                                          size: Dimensions.font15 / 1.5,
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
                                                          .HistoryStallName[
                                                      index]) {
                                                Get.toNamed(
                                                    RouterHelper.getMenu(x));
                                              }
                                            }
                                          },
                                          child: Container(
                                            height: Dimensions.height50 * 1.25,
                                            width: Dimensions.width45 * 2,
                                            padding: EdgeInsets.only(
                                                left: Dimensions.width10,
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
                                                text: 'ReOrder',
                                                color: Colors.black54,
                                                size: Dimensions.font15 * 0.9,
                                              )),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ))
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
