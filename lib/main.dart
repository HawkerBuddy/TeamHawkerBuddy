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
  loadData();
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

Future<void> loadData() async {
  LinktoBackends data = LinktoBackends(index: 0);
  DataController.SliderText = await data.getStallName();
  DataController.CanteenName = await data.getCanteenName();


  DataController.StallsID = await data.getStallID();
  DataController.StallsUrl = await data.getStallUrl();
  DataController.PGPStallNames = await data.getStallName();
  DataController.PGPStallDes = await data.getStallDescription();

  //give a List<String> for stall at index 0
  DataController.PGPFoodName = await data.foodName(DataController.StallsID);
  DataController.PGPFoodImgUrl = await data.foodImgUrl(DataController.StallsID);
  DataController.PGPFoodDes = await data.foodDes(DataController.StallsID);
  DataController.PGPFoodPrice = await data.foodPrice(DataController.StallsID);
  DataController.PGPFoodID = await data.foodID(DataController.StallsID);
  DataController.HistoryStallName = await data.historyStallName();
  DataController.HistoryOrderTime = await data.historyOrderTime();
}
