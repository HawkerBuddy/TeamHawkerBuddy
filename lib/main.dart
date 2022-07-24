import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hawker_buddy/controllers/auth_controller.dart';
import 'package:hawker_buddy/controllers/data_controller.dart';
import 'package:get/get.dart';
import 'package:hawker_buddy/controllers/router_controller.dart';
import 'controllers/backend_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await base.init();
  await Firebase.initializeApp();
  loadData();
  //linking app to database before running app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: AuthController().handleAuthState(),
      getPages: RouterHelper.routes,
    );
  }
}

//Function to load Data from the backends
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
  /*
  DataController.OrderStallID = await data.orderGetStallID();
  DataController.OrderStallName = await data.orderGetStallName();
  DataController.OrderStallImgUrl = await data.orderGetStallUrl();
  DataController.OrderFoodName =
      await data.orderfoodName(DataController.OrderStallID);
  DataController.OrderFoodURl =
      await data.orderfoodUrl(DataController.OrderStallID);
  DataController.OrderFoodDes =
      await data.orderfoodDes(DataController.OrderStallID);
  DataController.OrderFoodSize =
      await data.orderfoodSize(DataController.OrderStallID);
  DataController.OrderFoodID =
      await data.orderfoodID(DataController.OrderStallID);

   */

  DataController.HistoryStallName = await data.historyStallName();
  DataController.HistoryOrderTime = await data.historyOrderTime();
}
