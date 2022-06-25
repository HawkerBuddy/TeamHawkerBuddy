import 'package:get/get_connect/connect.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class ApiClient extends GetConnect implements GetxService {

  late String token;
  final String backendUrl;
  late Map<String,String> _mainHeaders;

  ApiClient({required this.backendUrl}) {
    baseUrl = backendUrl;
    timeout = Duration(seconds: 30);
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

    // map use {} list = []
}

