import 'package:intl/intl.dart';

class IDdetails {
  //Default Constructor

  DateTime time = DateTime.now();
  static int orderId = 0;
  static int cartId = 0;
  List<String> orderID = [];
  List<String> cartID = [];

  IDdetails() {}

  Future<void> timeStamp() async {
    return print(time.year.toString() +
        time.month.toString() +
        time.day.toString() +
        time.hour.toString() +
        time.minute.toString() +
        time.second.toString());
  }

  Future<String> orderNumberID() async {
    orderID.add('id');
    orderId++;
    return orderID.last;
  }

  Future<String> cartNumberID() async {
    cartID.add('id');
    cartId++;
    return cartID.last;
  }
}
