import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawker_buddy/controllers/backend_controller.dart';
import 'package:hawker_buddy/controllers/data_controller.dart';
import 'package:hawker_buddy/pages/home/home_Page.dart';
import 'package:hawker_buddy/widgets/expandable_food.dart';

import '../../controllers/router_controller.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_column.dart';
import '../../widgets/app_icons.dart';
import '../../widgets/unique_text.dart';

class MenuPage extends StatefulWidget {
  int pageID;
  MenuPage({Key? key, required this.pageID}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  @override
  Widget build(BuildContext context) {
    LinktoBackends.stallID = DataController.StallsID[widget.pageID];
    DataController.PGPFoodDes[widget.pageID].removeWhere((item) => ["", null].contains(item));
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child:
              Container(
                width: double.maxFinite,
                height: Dimensions.foodImgSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          DataController.StallsUrl[widget.pageID],
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
                        Get.to(const HomePage());
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(text:DataController.PGPStallNames[widget.pageID],),
                      SizedBox(height:Dimensions.height10),
                      uniqueText(text: "About us",size:20),
                      SizedBox(height:Dimensions.height10),
                      ExpandableFood(text: DataController.PGPStallDes[widget.pageID]),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: DataController.PGPFoodDes[widget.pageID].length,
                          itemBuilder: (context,index){
                            return GestureDetector(
                              onTap: () {
                                RouterHelper.fromCart = false;
                                RouterHelper.gettest(widget.pageID);
                                RouterHelper.initialQuantity = 0;
                                Get.toNamed(RouterHelper.getfooddetails(index));
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: Dimensions.width20, bottom: Dimensions.height10),
                                child: Row(
                                  children: [
                                    LinktoBackends(index: 0).foodImage(context),
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

                                              uniqueText(text: DataController.PGPFoodName[widget.pageID][index]),
                                              SizedBox(height: Dimensions.height10),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Text(DataController.PGPFoodDes[widget.pageID][index],
                                                    overflow: TextOverflow.fade,
                                                    maxLines: 2,
                                                    softWrap: false,),
                                                  ),
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
