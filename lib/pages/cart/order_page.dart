import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hawker_buddy/data/orders_made.dart';
import 'package:hawker_buddy/pages/home/home_Page.dart';
import 'package:hawker_buddy/pages/home/newHome.dart';
import 'package:hawker_buddy/widgets/small_text.dart';
import 'package:hawker_buddy/widgets/unique_text.dart';

import '../../data/cart_data.dart';
import '../../data_controller.dart';
import '../../routes/router_helper.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icons.dart';

class OrderPage extends StatefulWidget {
  int orderpageID;
  OrderPage({Key? key, required this.orderpageID}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int number =0 ;
  void refresh() {
    setState() {
      number = DataController.OrderStallName.length;
    }
  }
  @override
  Widget build(BuildContext context) {

    DataController.OrderFoodName[widget.orderpageID].removeWhere((item) =>["", null].contains(item));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.height20 * 2,
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
                      itemCount: DataController.OrderFoodName[widget.orderpageID].length,
                      itemBuilder: (context, index){
                        return Container(
                          height: 100,
                          width: double.maxFinite,

                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  //DataController.addDoc("user", DataController.user);
                                  //DataController.read("user");
                                  //DataController.create();
                                  //Get.toNamed()
                                },
                                child: Container(
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
                              ),
                              SizedBox(width: Dimensions.width10),
                              Expanded(child: Container(
                                height: Dimensions.height20*5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    uniqueText(text: DataController.OrderFoodName[widget.orderpageID][index]),
                                    miniText(text: "Number of Items"),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        uniqueText(text:"Some Text",color: Colors.redAccent,size: Dimensions.font15,),
                                        Container(

                                          height: Dimensions.height50*1.25,
                                          width: Dimensions.width45*3,
                                          padding: EdgeInsets.only(top: Dimensions.width10, left: Dimensions.width20, bottom: Dimensions.width20, right: Dimensions.width10),
                                          decoration: BoxDecoration(
                                            //color: AppColors.iconshopopen,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(Dimensions.radius20*2),
                                                  topRight: Radius.circular(Dimensions.radius20*2)
                                              )
                                          ),

                                          child: GestureDetector(
                                            onTap: () {
                                              RouterHelper.pageID = 1;
                                              Get.toNamed(RouterHelper.getfooddetails(1));
                                            },
                                            child: Container(
                                              //height: Dimensions.height30,
                                              padding: EdgeInsets.only(right: Dimensions.width10, left: Dimensions.width10,top: Dimensions.height5, bottom: Dimensions.height5),
                                              child: uniqueText(text:'Edit Item', color: Colors.black54,size: Dimensions.font15,),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(Dimensions.radius20),
                                                color: AppColors.mainColor,
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
              padding: EdgeInsets.only(top: Dimensions.width10, left: Dimensions.width30 * 3 , bottom: Dimensions.width20, right: Dimensions.width30 * 3),
              decoration: BoxDecoration(
                //color: AppColors.iconshopopen,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20*2),
                      topRight: Radius.circular(Dimensions.radius20*2)
                  )
              ),



                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      //height: Dimensions.height30,
                      padding: EdgeInsets.only(right: Dimensions.width10, left: Dimensions.width10,top:Dimensions.height5/2,),
                      child: Center(child: uniqueText(text:'Confirm Order', color: Colors.black54,size: Dimensions.font20,)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
            ),
          )
        ],
      ),
    );
  }
}
