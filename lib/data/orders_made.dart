import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hawker_buddy/SignIn/auth_controller.dart';

import '../data_controller.dart';

class Orders {
   String? cartID; //userID
   String? orderID;
   String? orderTime;
   String? stallName;
   String? stallID;
   String? status; //update user
   double? totalPrice;

  Orders({required this.cartID,
          required this.orderID,
          required this.orderTime,
          required this.stallName,
          required this.stallID,
          required this.status,
          required this.totalPrice});

  factory Orders.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,) {
    final data = snapshot.data();
    return Orders(
      cartID: data?["cartID"],
      orderID: data?["orderID"],
      orderTime: data?["orderTime"],
      stallName: data?["stallName"],
      stallID: data?["stallID"],
      status: data?["status"],
      totalPrice: data?["totalPrice"],
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      if(cartID != null) "cartID":cartID,
      if(orderID != null) "orderID":orderID,
      if(orderTime != null) "orderTime":orderTime,
      if(stallName != null) "stallName":stallName,
      if(stallID != null) "stallID":stallID,
      if(status != null) "status":status,
      if(totalPrice != null) "totalPrice": totalPrice,
    };
  }
   addtoCart(Orders orders, String stallImg) {
     final docRef = DataController.db
         .collection("orders")
         .doc(AuthController.userId!)
         .collection('OrderHistory')
         .doc(stallID)
         .collection('Order')
         .withConverter(
         fromFirestore: Orders.fromFireStore,
         toFirestore: (Orders order, options) => order.toFireStore())
         .doc(orderID)
         .set(orders);
   }
}