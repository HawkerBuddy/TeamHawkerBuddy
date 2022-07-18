
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hawker_buddy/SignIn/auth_controller.dart';
import 'package:hawker_buddy/data/IDdetails.dart';
import 'package:hawker_buddy/data/orders_made.dart';

class DataController {
  static FirebaseFirestore db = FirebaseFirestore.instance;
  static List<String> SliderText = [""];
  static List<String> CanteenName = [""];
  static List<String> StallsID = [""];
  static List<String> StallsUrl = [""];
  static List<String> PGPStallNames = [""];
  static List<String> PGPStallDes = [""];
  static List<List<String>> PGPFoodName = [[""]];

  static final user = <String, dynamic>{
    "first": "Ada",
    "last": "Lovelace",
    "born": 1815
  };  
  
  static final order =  Orders(
    cartID: IDdetails.cartId.toString(),
    discountCode: "699999",
    orderID: IDdetails.orderID.toString(),
    orderTime: IDdetails.timeStamp(),
    restaurantID: "Protein",
    userID: AuthController.userId,
    status: true,
    totalPrice: 200000,
  );

  static void addDoc(String collectionName, Map<String, dynamic> input) {
    db.collection(collectionName).add(input).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }

  static Future<void> read(String collectionName) async {
    await db.collection(collectionName).get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
      }
    });
  }
  
  static final docRef = db.collection("orders")
      .withConverter(fromFirestore: Orders.fromFireStore,
                     toFirestore: (Orders order, options) => order.toFireStore())
      .doc();
  static create() async {
    await docRef.set(order);
  }
}