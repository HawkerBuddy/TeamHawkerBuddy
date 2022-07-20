import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hawker_buddy/SignIn/auth_controller.dart';
import 'package:hawker_buddy/data_controller.dart';
import 'package:hawker_buddy/pages/home/home_Page.dart';
import 'package:get/get.dart';
import 'package:hawker_buddy/pages/home/newHome.dart';
import 'package:hawker_buddy/routes/router_helper.dart';
import 'data/stallDetails.dart';
import 'helper/dependencies.dart' as base;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await base.init();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  textStallYIH stallYIH = textStallYIH(index: 0);
  DataController.SliderText = await stallYIH.getStallName();
  DataController.CanteenName = await stallYIH.getCanteenName();


  DataController.StallsID = await stallYIH.getStallID();
  DataController.StallsUrl = await stallYIH.getStallUrl();
  DataController.PGPStallNames = await stallYIH.getStallName();
  DataController.PGPStallDes = await stallYIH.getStallDescription();

  //give a List<String> for stall at index 0
  DataController.PGPFoodName = await stallYIH.foodName(DataController.StallsID);
  DataController.PGPFoodImgUrl = await stallYIH.foodImgUrl(DataController.StallsID);
  DataController.PGPFoodDes = await stallYIH.foodDes(DataController.StallsID);
  DataController.PGPFoodPrice = await stallYIH.foodPrice(DataController.StallsID);
  DataController.PGPFoodID = await stallYIH.foodID(DataController.StallsID);
  //linking app to database before running app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: homepage(),
      //initialRoute: RouterHelper.getLoginPage(),
      getPages: RouterHelper.routes,

      //HomePage()
      //FoodDetails(),
      //MainFoodPage(),
      //LoginPage(),
      //SignUpPage(),
      //WelcomePage(),
    );
  }
}
