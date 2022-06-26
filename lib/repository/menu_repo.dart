
import 'package:get/get.dart';
import 'package:hawker_buddy/data/api/api_client.dart';

class MenuRepo extends GetxService {
  final ApiClient apiClient;
  MenuRepo({required this.apiClient});
//


  Future<Response> getMenuList() async {
    //end point url = url of the server 
    return await apiClient.getData("end point url");
  }


}