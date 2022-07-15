import 'package:intl/intl.dart';

class IDdetails {
  //Default Constructor

  static DateTime time = DateTime.now();
  static int orderId = 0;
  static int cartId = 0;
  static List<String> orderID = [];
  static List<String> cartID = [];

  static String timeStamp() {
    return time.year.toString() +
        '/' +
        time.month.toString() +
        '/' +
        time.day.toString() +
        ' ' +
        time.hour.toString() +
        ":" +
        time.minute.toString() +
        ":" +
        time.second.toString();
  }

  static String orderNumberID() {
    orderID.add(orderId.toString());
    orderId++;
    return orderID.last;
  }

  static String cartNumberID() {
    cartID.add(cartId.toString());
    cartId++;
    return cartID.last;
  }
}
