import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hawker_buddy/auth_controller.dart';
import 'package:hawker_buddy/pages/home/home_Page.dart';
import 'package:get/get.dart';
import 'package:hawker_buddy/routes/router_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  //linking app to database before running app
  //hello
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
      home: HomePage(),
      initialRoute: RouterHelper.initial,
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
