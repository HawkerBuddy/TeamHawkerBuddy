import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hawker_buddy/data/stallDetails.dart';
import 'package:hawker_buddy/routes/router_helper.dart';
import 'package:hawker_buddy/utils/mocklist.dart';
import 'package:hawker_buddy/widgets/app_column.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/icon_and_text.dart';
import '../../widgets/small_text.dart';
import '../../widgets/unique_text.dart';

//old page not used
class Foodpage extends StatefulWidget {
  const Foodpage({Key? key}) : super(key: key);

  @override
  State<Foodpage> createState() => FoodpageState();
}

class FoodpageState extends State<Foodpage> {
  //PageController Object to control page
  PageController pageController = PageController(viewportFraction: 0.85);

  //factors for animation
  var currentPageValue = 0.0;
  double scaleFactor = 0.8;

  //setting Dynamic height
  double height = Dimensions.pageViewContainer;

  //function to update real time page value
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      //update new values let Ui know whenever there is a new value
      setState(() {
        //! checking null state
        currentPageValue = pageController.page!;
        //print("CUrrent value is " + currentPageValue.toString());
       });
    });
  }

  //clear memory, keep memory as small as possible
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Column widget with all Ui of food page body
    return Column(
      children: [
        //Container Widget with Slider of 5 items
        Container(
          //color: Colors.redAccent,
          height: Dimensions.pageView,
          child:
            PageView.builder(
                controller: pageController,
                itemCount: 5, //default value
                itemBuilder: (context, position) {
                  /*each loop create a custom buildPageItem which returns a transform widget  (picture + text) + AppColumn Object*/
                  return buildPageItem(position);
            },
          ),
        ),

        //dots slide bar with preset of 5 dots
        new DotsIndicator(
          dotsCount: 5,
          position: currentPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeColor: AppColors.mainColor,
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),),

        //SizedBox widget creates an empty space of 20
        //SizedBox(height: Dimensions.height20,),

        //Container contain Popular Hawker Centre + food icon + smaller text nearby
        /*

        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          //Row Widget contains text +  icon + smaller text
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children:[
              uniqueText(text: 'Popular hawker Centre'),
              Container(
                child:Icon(Icons.food_bank, color: AppColors.icon1),
              ),
              //SizedBox(width: Dimensions.width10,),
              Container(
                child: miniText(text:"nearby"),
              ),
            ]

          ),
        ),

        //ListView Widget contains a list of nearby popular stores
        //use Container( height: xxxx for debugging)
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
                                  IconsAndText(
                                    icon: Icons.circle_sharp,
                                    text: "Open",
                                    iconColor: AppColors.iconshopopen ,
                                  ),
                                  IconsAndText(
                                    icon: Icons.location_on,
                                    text: "100km",
                                    iconColor: AppColors.iconlocation ,
                                  ),
                                  IconsAndText(
                                    icon: Icons.access_time_rounded,
                                    text: "20min",
                                    iconColor: AppColors.iconque ,
                                  )
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
         */
      ],
    );
  }

  //build page item function
  Widget buildPageItem(int index){

    textStallYIH img = textStallYIH(index: index);

    //scaling function
    Matrix4 matrix = new Matrix4.identity();

    var trans = 0.0;
    var scale = 0.0;

    //check if the index the current page value and control sliding size
    if(index == currentPageValue.floor()){
      scale = 1 - (currentPageValue - index) * (1-scaleFactor);
      trans = height * (1-scale)/2;
      //for calling void functions with no return values
      matrix = Matrix4.diagonal3Values(1, scale, 1)..setTranslationRaw(0,trans,0);
      //print("scale: " + scale.toString());
    } else if (index == currentPageValue.floor() + 1) {
      scale = scaleFactor + (currentPageValue - index + 1) * (1 - scaleFactor);
      matrix = Matrix4.diagonal3Values(1, scale, 1);
      trans = height * (1-scale)/2;
      matrix = Matrix4.diagonal3Values(1, scale, 1)..setTranslationRaw(0,trans,0);
      //print("scale: " + scale.toString());
    } // index at next page
    else if (index == currentPageValue.floor() - 1) {
      scale = 1 - (currentPageValue - index) * (1-scaleFactor);
      matrix = Matrix4.diagonal3Values(1, scale, 1);
      trans = height * (1-scale)/2;
      matrix = Matrix4.diagonal3Values(1, scale, 1)..setTranslationRaw(0,trans,0);
      //print("scale: " + scale.toString());
    } else {
      scale = 0.8;
      matrix = Matrix4.diagonal3Values(1, scale, 1)..setTranslationRaw(0, height * (1-scale)/2, 1);
    }

    // return a transformed widgets when scrolling
    return Transform(
      transform: matrix,
      child: Stack(
        children: [

          //Container containing sliding images animations
          GestureDetector(
            onTap: (){
              Get.toNamed(RouterHelper.getChickenRice());
            },
            child: Container(
                  //margins and overall looks for slider
                  height: Dimensions.pageViewContainer,
                  margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                 //child:img.stallImage(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius25),
                    color: index.isEven? Color(0xffe2cc33): Color(0xFFFF9500),

                    //image widget to insert picture
                    image: DecorationImage(
                        fit:BoxFit.cover,
                        image:
                        AssetImage("assets/images/" + mocklist.slider_images[index]
                        )
                    ),


                  ),
                ),
          ),
          //Align Widget containing the details about sliding images
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(

              //margins and dimensions of the container
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30,bottom: Dimensions.height10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  //shadow effects for container
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                      //adjusting the how blur it will be
                      blurRadius: 5.0,
                    //offset pixles
                    offset: Offset(0,5)
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0)
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0)
                  )
                ]
              ),
              //Container Widget including the text xxxx
              child: Container(
                padding: EdgeInsets.only(top:Dimensions.height10, left: Dimensions.width15, right: Dimensions.width15),
                child: const AppColumn(text: " Chicken rice "),
              ),
            ),

          )
        ]
      ),
    );
  }
}
