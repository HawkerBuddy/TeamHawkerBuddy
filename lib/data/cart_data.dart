
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hawker_buddy/data_controller.dart';

class CartData {

  int quantity = 0;
  final double? price;
  double? totalPrice;
  String? foodID;

  //add userID
  String? userID;
  static int itemsOrdered = 0;

  CartData(this.quantity,this.price, this.totalPrice, this.foodID,this.userID);

  //used to send data to backend
  CartData.n({required this.quantity, this.price, this.totalPrice, this.foodID, this.userID});

  factory CartData.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,) {
    final data = snapshot.data();
    return CartData.n(
      quantity: data?["quantity"],
      price:data?["price"],
      totalPrice: data?["totalPrice"],
      foodID: data?["foodID"],
      userID: data?["userID"]
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      if(quantity != null) "quantity":quantity,
      if(price != null) "price":price,
      if(totalPrice != null) "totalPrice":totalPrice,
      if(foodID != null) "foodID":foodID,
      if(userID != null) "userID":userID,
    };
  }

  addtoCart(CartData cartData){

          final docRef = DataController.db.collection("Cart")
          .withConverter(fromFirestore: CartData.fromFireStore,
           toFirestore: (CartData cartData, options) => cartData.toFireStore())
           .doc().set(cartData);
  }

  setQuantity(int quantity) {
    this.quantity = quantity;
    totalPrice = quantity * price!;
  }

  increment(){
    if(quantity!=0){
      quantity++;
    }
  }

  decrement(){
    if(quantity!=0){
      quantity--;
    }
  }

  int? getQuantity(){
    return quantity;
  }

  double? gettotalPrice(){
    return totalPrice;
  }

  double? setTotalPrice(double totalPrice){
    this.totalPrice = totalPrice;
  }

  addtoCartindex(){
    itemsOrdered++;
  }

  removeFromCart(){
    if(itemsOrdered != 0) {
      itemsOrdered --;
    }
  }


}