import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawker_buddy/controllers/data_controller.dart';
import 'package:hawker_buddy/controllers/router_controller.dart';
import 'package:hawker_buddy/widgets/app_column.dart';

import '../../controllers/backend_controller.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/icon_and_text.dart';
import '../../widgets/small_text.dart';
import '../../widgets/unique_text.dart';

class stallsPage extends StatefulWidget {
  const stallsPage({Key? key}) : super(key: key);
  @override
  State<stallsPage> createState() => stallsPageState();
}

class stallsPageState extends State<stallsPage> {
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
    //DataController.PGPStallNames.removeWhere((item) =>["",null].contains(item));
    //Column widget with all Ui of food page body
    return Column(
      children: [
        //Container Widget with Slider of 5 items
        SizedBox(
          //color: Colors.redAccent,
          //change to dynamic dimensions
          height: Dimensions.height250,
          child: PageView.builder(
            controller: pageController,
            itemCount: DataController.PGPStallNames.length, //default value
            itemBuilder: (context, position) {
              /*each loop create a custom buildPageItem which returns a transform widget  (picture + text) + AppColumn Object*/
              return buildPageItem(position);
            },
          ),
        ),

        //dots slide bar with preset of 5 dots
        DotsIndicator(
          dotsCount: DataController.PGPStallNames.length,
          position: currentPageValue,
          decorator: DotsDecorator(
            size: Size.square(Dimensions.width10),
            activeColor: AppColors.mainColor,
            activeSize: Size(Dimensions.width10 * 2, Dimensions.width10),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius10 / 2)),
          ),
        ),

        //SizedBox widget creates an empty space of 20
        SizedBox(
          height: Dimensions.height20,
        ),

        //Container contain Popular Hawker Centre + food icon + smaller text nearby
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          //Row Widget contains text +  icon + smaller text
          child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            uniqueText(text: 'Featured Stalls'),
            const Icon(Icons.food_bank, color: AppColors.icon1),
            //SizedBox(width: Dimensions.width10,),
            miniText(text: "Promotions"),
          ]),
        ),

        //ListView Widget contains a list of nearby popular stores
        //use Container( height: xxxx for debugging)
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: DataController.PGPStallNames.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed(RouterHelper.getMenu(index));
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      bottom: Dimensions.height10),
                  child: Row(
                    children: [
                      //image section
                      /*
                    Container(
                      width:Dimensions.ListViewImgSize,
                      height:Dimensions.ListViewImgSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                            DataController.StallsUrl[index],
                          )
                         //image: NetworkImage(DataController.StallsUrl[0]),
                        )
                      ),
                    ),
                     */
                      LinktoBackends(index: index).featuredStallImage(context),
                      //text container
                      Expanded(
                        child: Container(
                          height: Dimensions.ListViewTextContSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimensions.radius20),
                                bottomRight:
                                    Radius.circular(Dimensions.radius20)),
                            color: AppColors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: Dimensions.width10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                uniqueText(
                                    text: DataController.PGPStallNames[index]),
                                SizedBox(height: Dimensions.height10),
                                Expanded(
                                    child: Text(
                                        DataController.PGPStallDes[index],
                                        overflow: TextOverflow.fade,
                                        maxLines: 2,
                                        softWrap: false)),
                                SizedBox(height: Dimensions.height10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    IconsAndText(
                                      icon: Icons.circle_sharp,
                                      text: "Open",
                                      iconColor: AppColors.iconshopopen,
                                    ),
                                    IconsAndText(
                                      icon: Icons.location_on,
                                      text: "100km",
                                      iconColor: AppColors.iconlocation,
                                    ),
                                    IconsAndText(
                                      icon: Icons.access_time_rounded,
                                      text: "20min",
                                      iconColor: AppColors.iconque,
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
      ],
    );
  }

  //build page item function
  Widget buildPageItem(int index) {
    //scaling function
    Matrix4 matrix = Matrix4.identity();

    LinktoBackends img = LinktoBackends(index: index);

    var trans = 0.0;
    var scale = 0.0;

    //check if the index the current page value and control sliding size
    if (index == currentPageValue.floor()) {
      scale = 1 - (currentPageValue - index) * (1 - scaleFactor);
      trans = height * (1 - scale) / 2;
      //for calling void functions with no return values
      matrix = Matrix4.diagonal3Values(1, scale, 1)
        ..setTranslationRaw(0, trans, 0);
      //print("scale: " + scale.toString());
    } else if (index == currentPageValue.floor() + 1) {
      scale = scaleFactor + (currentPageValue - index + 1) * (1 - scaleFactor);
      matrix = Matrix4.diagonal3Values(1, scale, 1);
      trans = height * (1 - scale) / 2;
      matrix = Matrix4.diagonal3Values(1, scale, 1)
        ..setTranslationRaw(0, trans, 0);
      //print("scale: " + scale.toString());
    } // index at next page
    else if (index == currentPageValue.floor() - 1) {
      scale = 1 - (currentPageValue - index) * (1 - scaleFactor);
      matrix = Matrix4.diagonal3Values(1, scale, 1);
      trans = height * (1 - scale) / 2;
      matrix = Matrix4.diagonal3Values(1, scale, 1)
        ..setTranslationRaw(0, trans, 0);
      //print("scale: " + scale.toString());
    } else {
      scale = 0.8;
      matrix = Matrix4.diagonal3Values(1, scale, 1)
        ..setTranslationRaw(0, height * (1 - scale) / 2, 1);
    }

    // return a transformed widgets when scrolling
    return Transform(
      transform: matrix,
      child: Stack(children: [
        //Container containing sliding images animations
        SizedBox(
          height: Dimensions.height10 * 18,
          child: GestureDetector(
            onTap: () {
              Get.toNamed(RouterHelper.getMenu(index));
            },
            child: img.stallImage(context),
          ),
        ),
        //Align Widget containing the details about sliding images
        SizedBox(
          height: Dimensions.height250 * 2,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              //margins and dimensions of the container
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.white,
                  boxShadow: [
                    //shadow effects for container
                    BoxShadow(
                        color: AppColors.shadow,
                        //adjusting the how blur it will be
                        blurRadius: Dimensions.radius10 / 2,
                        //offset pixels
                        offset: const Offset(0, 5)),
                    const BoxShadow(
                        color: AppColors.white, offset: Offset(-5, 0)),
                    const BoxShadow(
                        color: AppColors.white, offset: Offset(5, 0))
                  ]),
              //Container Widget including the text
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height5,
                    left: Dimensions.width15,
                    right: Dimensions.width15),
                child: AppColumn(text: DataController.SliderText[index]),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
