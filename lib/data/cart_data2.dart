import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hawker_buddy/data_controller.dart';

class CartData2 {
  int quantity = 0;
  final double? price;
  double? totalPrice;
  String? foodID;

  //add userID
  String? userID;
  static int itemsOrdered = 0;

  //First Constructor
  CartData2(
      this.quantity, this.price, this.totalPrice, this.foodID, this.userID);

  //Second Constructor
  CartData2.n(
      {required this.quantity,
      this.price,
      this.totalPrice,
      this.foodID,
      this.userID});

  //Read from FireStore
  factory CartData2.fromFireStore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return CartData2.n(
        quantity: data?["quantity"],
        price: data?["price"],
        totalPrice: data?["totalPrice"],
        foodID: data?["foodID"],
        userID: data?["userID"]);
  }

  //Write to FireStore
  Map<String, dynamic> toFireStore() {
    return {
      if (quantity != null) "quantity": quantity,
      if (price != null) "price": price,
      if (totalPrice != null) "totalPrice": totalPrice,
      if (foodID != null) "foodID": foodID,
      if (userID != null) "userID": userID,
    };
  }

  addtoCart(CartData2 cartData,String StallID) {
    final docRef = DataController.db
        .collection("Cart")
        .doc(userID)
        .collection(StallID)
        .withConverter(
            fromFirestore: CartData2.fromFireStore,
            toFirestore: (CartData2 cartData, options) => cartData.toFireStore())
        .doc(foodID)
        .set(cartData);
  }

  void deleteCartDocument(String documentID, String stallID) async {
    final docRef = FirebaseFirestore.instance;

    await docRef.collection('Cart').doc(userID).collection(stallID).doc(documentID).delete();
  }

  void addCollection(String userID) {
    FirebaseFirestore.instance
        .collection('/Cart/' + userID + '/CartOrder')
        .add({});
  }

  //Additional functions
  setQuantity(int quantity) {
    this.quantity = quantity;
    totalPrice = quantity * price!;
  }

  increment() {
    if (quantity != 0) {
      quantity++;
    }
  }

  decrement() {
    if (quantity != 0) {
      quantity--;
    }
  }

  int? getQuantity() {
    return quantity;
  }

  double? gettotalPrice() {
    return totalPrice;
  }

  double? setTotalPrice(double totalPrice) {
    this.totalPrice = totalPrice;
  }

  addtoCartindex() {
    itemsOrdered++;
  }

  removeFromCart() {
    if (itemsOrdered != 0) {
      itemsOrdered--;
    }
  }
}
