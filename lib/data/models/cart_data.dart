import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hawker_buddy/controllers/data_controller.dart';

import '../../controllers/auth_controller.dart';

class CartData {
  int quantity = 0;
  double? price;
  double? totalPrice;
  String? foodID;
  String? foodName;
  String? stallName;
  String ? stallID;
  String ? foodImgUrl;
  String ? foodDetails;

  //add userID
  String? userID;
  static int itemsOrdered = 0;

  //First Constructor
  CartData(
      this.quantity, this.price, this.totalPrice, this.foodID,
      this.userID, this.foodName, this.stallID, this.stallName, this.foodImgUrl, this.foodDetails);

  CartData.delete();

  //Second Constructor
  CartData.n(
      {required this.quantity,
        this.price,
        this.totalPrice,
        this.foodID,
        this.userID,
        this.foodName,
        this.stallID,
        this.stallName,
        this.foodImgUrl,
        this.foodDetails,});

  //Read from FireStore
  factory CartData.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return CartData.n(
        quantity: data?["quantity"],
        price: data?["price"],
        totalPrice: data?["totalPrice"],
        foodID: data?["foodID"],
        userID: data?["userID"],
        foodName: data?["foodName"],
        stallID: data?["stallID"],
        stallName: data?["stallName"],
        foodImgUrl: data?["foodImgUrl"],
        foodDetails: data?["foodDetails"],);
  }

  //Write to FireStore
  Map<String, dynamic> toFireStore() {
    return {
      if (quantity != null) "quantity": quantity,
      if (price != null) "price": price,
      if (totalPrice != null) "totalPrice": totalPrice,
      if (foodID != null) "foodID": foodID,
      if (userID != null) "userID": userID,
      if (foodName != null) "foodName" : foodName,
      if (stallID !=null) "stallID" : stallID,
      if (stallName != null) "stallName" : stallName,
      if (foodImgUrl != null) "foodImgUrl" : foodImgUrl,
      if (foodDetails !=null) "foodDetails" : foodDetails,
    };
  }

  addtoCart(CartData cartData, String stallImg) {
    final docRef = DataController.db
        .collection("Cart")
        .doc(userID)
        .collection('Stalls')
        .doc(stallID)
        .collection('Order')
        .withConverter(
        fromFirestore: CartData.fromFireStore,
        toFirestore: (CartData cartData, options) => cartData.toFireStore())
        .doc(foodID)
        .set(cartData);

    final update = DataController.db
        .collection("Cart")
        .doc(userID)
        .collection('Stalls')
        .doc(stallID)
        .set({ "stallUrl": stallImg,
               "stallName": stallName,
               "stallID": stallID});
  }

  Future<List<String>> getStallName() async {
    List<String> saveName = [];
    var data = await FirebaseFirestore.instance
        .collection('Cart')
        .doc('Stalls')
        .collection(stallID!)
        .get();

    saveName = List.from(data.docs.map((doc) => doc.get("stallName")));
    return saveName;
  }

  Future<List<String>> getStallImg() async {
    List<String> saveName = [];
    var data = await FirebaseFirestore.instance
        .collection('Cart')
        .doc('Stalls')
        .collection(stallID!)
        .get();

    saveName = List.from(data.docs.map((doc) => doc.get("stallUrl")));
    return saveName;
  }

  void deleteCartDocument(String stallID) async {
    var name = await FirebaseFirestore.instance
        .collection('Cart')
        .doc(AuthController.userId!)
        .collection('Stalls')
        .doc(stallID)
        .collection('Order')
        .get();
    name.docs.forEach((doc) => doc.reference.delete());

    var name2 = await FirebaseFirestore.instance
        .collection('Cart')
        .doc(userID)
        .collection('Stalls')
        .doc(stallID).get();
    name2.reference.delete();
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
