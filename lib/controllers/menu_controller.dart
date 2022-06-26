import 'package:get/get.dart';

import '../repository/menu_repo.dart';

class MenuController extends GetxController {
   final MenuRepo menuRepo;

   MenuController({required this.menuRepo});

   //_ private field of menuList
   List<dynamic> _menuList = [];
   List<dynamic> get menuList => _menuList;

   Future<void> getMenuList() async {
     Response response = await menuRepo.getMenuList();
     //getX status code and normal http is 200, if reponse is correct, saved in list
     if(response.statusCode == 200) {
       _menuList = [];
       //_menuList.addAll();
       update();// set statu to let our UI know
     } else {
       //when failed to get normal response
     }
   }





}