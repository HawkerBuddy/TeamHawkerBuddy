import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hawker_buddy/controllers/menu_controller.dart';
import 'package:hawker_buddy/data/api/api_client.dart';
import 'package:hawker_buddy/repository/menu_repo.dart';

Future<void> init() async {
  //for API client
  Get.lazyPut(()=>ApiClient(backendUrl: "com.hawkerBuddy.base"));

  //for repo
  Get.lazyPut(() => MenuRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => MenuController(menuRepo: Get.find()));
}