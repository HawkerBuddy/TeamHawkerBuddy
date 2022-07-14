import 'package:cloud_firestore/cloud_firestore.dart';

class Orders {
  final String? cartID;
  final String? discountCode;
  final String? orderID;
  final String? orderTime;
  final String? restaurantID;
  final String? userID;
  final bool? status;
  final double? totalPrice;

  Orders({this.cartID,
         this.discountCode,
         this.orderID,
         this.orderTime,
         this.restaurantID,
         this.userID,
         this.status,
         this.totalPrice});

  factory Orders.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,) {
    final data = snapshot.data();
    return Orders(
      cartID: data?["cartID"],
      discountCode:data?["discountCode"],
      orderID: data?["orderID"],
      orderTime: data?["orderTime"],
      restaurantID: data?["restaurantID"],
      userID: data?["userID"],
      status: data?["status"],
      totalPrice: data?["totalPrice"],
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      if(cartID != null) "cartID":cartID,
      if(discountCode != null) "discountCode":discountCode,
      if(orderID != null) "orderID":orderID,
      if(orderTime != null) "orderTime":orderTime,
      if(restaurantID != null) "restaurantID":restaurantID,
      if(userID != null) "userID":userID,
      if(status != null) "status":status,
    };
  }

}