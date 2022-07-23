import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hawker_buddy/controllers/auth_controller.dart';

import '../utils/dimensions.dart';

class LinktoBackends {
  int index;
  static String? stallID;

  LinktoBackends({required this.index});

  //path to retrieve Canteen details
  Future<List<String>> getCanteenName() async {
    List<String> saveName = [];
    var data = await FirebaseFirestore.instance.collection('Canteen').get();
    saveName = List.from(data.docs.map((doc) => doc.get("name")));
    return saveName;
  }

  Future<List<String>> getCanteenAddress() async {
    List<String> saveName = [];
    var data = await FirebaseFirestore.instance.collection('Canteen').get();
    saveName = List.from(data.docs.map((doc) => doc.get("address")));
    return saveName;
  }

  Future<List<String>> getCanteenOpeningHours() async {
    List<String> saveName = [];
    var data = await FirebaseFirestore.instance.collection('Canteen').get();

    saveName = List.from(data.docs.map((doc) => doc.get("openingHours")));
    return saveName;
  }

  Future<List<String>> getCanteenRegion() async {
    List<String> saveName = [];
    var data = await FirebaseFirestore.instance.collection('Canteen').get();

    saveName = List.from(data.docs.map((doc) => doc.get("region")));
    return saveName;
  }

  //path to retrieve Stall Details
  Future<List<String>> getStallDescription() async {
    List<String> saveName = [];
    var data = await FirebaseFirestore.instance
        .collection('Canteen')
        .doc('PGP')
        .collection('Stalls')
        .get();

    saveName = List.from(data.docs.map((doc) => doc.get("description")));
    return saveName;
  }

  Future<List<String>> getStallID() async {
    List<String> saveName = [];
    var data = await FirebaseFirestore.instance
        .collection('Canteen')
        .doc('PGP')
        .collection('Stalls')
        .get();
    //print("checkpoint");
    saveName = List.from(data.docs.map((doc) => doc.get("stallID")));
    return saveName;
  }

  Future<List<String>> getStallName() async {
    List<String> saveName = [];
    var data = await FirebaseFirestore.instance
        .collection('Canteen')
        .doc('PGP')
        .collection('Stalls')
        .get();

    saveName = List.from(data.docs.map((doc) => doc.get("StallName")));
    return saveName;
  }

  Future<List<String>> getStallUrl() async {
    List<String> saveName = [];
    var data = await FirebaseFirestore.instance
        .collection('Canteen')
        .doc('PGP')
        .collection('Stalls')
        .get();

    saveName = List.from(data.docs.map((doc) => doc.get("stallImage")));
    return saveName;
  }

  Widget stallImage(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Canteen')
            .doc('PGP')
            .collection('Stalls')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius25),
                  color: Colors.white),
            );
          }
          return Container(
            //margins and overall looks for slider
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            //child:img.stallImage(context),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius25),
                //color: index.isEven? Color(0xffe2cc33): Color(0xFFFF9500),
                //image widget to insert picture
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: //AssetImage("assets/images/XINLI4.png")
                      CachedNetworkImageProvider(
                          snapshot.data?.docs[index]['stallImage']),
                )),
            /* child: CachedNetworkImage(
              imageUrl: snapshot.data?.docs[index]['stallImage'],
              fit: BoxFit.cover,
            )

             */
          );
        });
  }

  //Helper function to retrieve Menu Details
  Future<List<String>> _menuHelper(String stallID, String output) async {
    List<String> saveName = [];
    var data = await FirebaseFirestore.instance
        .collection('Canteen')
        .doc('PGP')
        .collection('Stalls')
        .doc(stallID)
        .collection('menu')
        .get();
    //input take in List<String> then u output List<list<String>>>;
    saveName = List.from(data.docs.map((doc) => doc.get(output)));
    return saveName;
  }

  //path to retrieve Menu Details
  Future<List<List<String>>> foodName(List<String> stallID) async {
    var food = List.generate(10, (i) => List.filled(10, "", growable: true),
        growable: true);

    for (int i = 0; i < stallID.length; i++) {
      List<String> noOfFood = await _menuHelper(stallID[i], "foodName");
      for (int j = 0; j < noOfFood.length; j++) {
        food[i][j] = noOfFood[j];
      }
    }
    food.removeWhere((item) => ["", null].contains(item));
    return food;
  }

  Future<List<List<String>>> foodImgUrl(List<String> stallID) async {
    var food = List.generate(10, (i) => List.filled(10, "", growable: true),
        growable: true);

    for (int i = 0; i < stallID.length; i++) {
      List<String> noOfFood = await _menuHelper(stallID[i], "image");
      for (int j = 0; j < noOfFood.length; j++) {
        food[i][j] = noOfFood[j];
      }
    }
    food.removeWhere((item) => ["", null].contains(item));
    return food;
  }

  Future<List<List<String>>> foodPrice(List<String> stallID) async {
    var food = List.generate(10, (i) => List.filled(10, "", growable: true),
        growable: true);

    for (int i = 0; i < stallID.length; i++) {
      List<String> noOfFood = await _menuHelper(stallID[i], "price");
      for (int j = 0; j < noOfFood.length; j++) {
        food[i][j] = noOfFood[j];
      }
    }
    food.removeWhere((item) => ["", null].contains(item));
    return food;
  }

  Future<List<List<String>>> foodDes(List<String> stallID) async {
    var food = List.generate(10, (i) => List.filled(10, "", growable: true),
        growable: true);
    for (int i = 0; i < stallID.length; i++) {
      List<String> noOfFood = await _menuHelper(stallID[i], "description");
      for (int j = 0; j < noOfFood.length; j++) {
        food[i][j] = noOfFood[j];
      }
    }
    food.removeWhere((item) => ["", null].contains(item));
    return food;
  }

  Future<List<List<String>>> foodID(List<String> stallID) async {
    var food = List.generate(10, (i) => List.filled(10, "", growable: true),
        growable: true);
    for (int i = 0; i < stallID.length; i++) {
      List<String> noOfFood = await _menuHelper(stallID[i], "foodId");
      for (int j = 0; j < noOfFood.length; j++) {
        food[i][j] = noOfFood[j];
      }
    }
    food.removeWhere((item) => ["", null].contains(item));
    return food;
  }

  Widget foodImage(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Canteen')
            .doc('PGP')
            .collection('Stalls')
            .doc(stallID)
            .collection("menu")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              decoration: const BoxDecoration(
                  //borderRadius: BorderRadius.circular(Dimensions.radius25),
                  color: Colors.white),
            );
          }
          return Container(
              width: Dimensions.ListViewImgSize,
              height: Dimensions.ListViewImgSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                      snapshot.data?.docs[index]['image']),
                ),
              ));
        });
  }

  //path to retrieve History Orders details more to update
  Future<List<String>> historyStallName() async {
    List<String> saveName = [];
    var data = await FirebaseFirestore.instance
        .collection('orders')
        .doc(AuthController.userId)
        .collection('OrderHistory')
        .get();

    saveName = List.from(data.docs.map((doc) => doc.get("stallName")));
    return saveName;
  }

  Future<List<String>> historyOrderTime() async {
    List<String> saveName = [];
    var data = await FirebaseFirestore.instance
        .collection('orders')
        .doc(AuthController.userId)
        .collection('OrderHistory')
        .get();

    saveName = List.from(data.docs.map((doc) => doc.get("orderTime")));
    return saveName;
  }

  //path to retrieve Stall details from orders
  Future<List<String>> orderGetStallName() async {
    List<String> saveName = [];
    var data = await FirebaseFirestore.instance
        .collection("Cart")
        .doc(AuthController.userId)
        .collection('Stalls')
        .get();

    saveName = List.from(data.docs.map((doc) => doc.get("stallName")));
    return saveName;
  }

  Future<List<String>> orderGetStallUrl() async {
    List<String> saveName = [];
    var data = await FirebaseFirestore.instance
        .collection("Cart")
        .doc(AuthController.userId)
        .collection('Stalls')
        .get();

    saveName = List.from(data.docs.map((doc) => doc.get("stallUrl")));
    return saveName;
  }

  Future<List<String>> orderGetStallID() async {
    List<String> saveName = [];
    var data = await FirebaseFirestore.instance
        .collection("Cart")
        .doc(AuthController.userId)
        .collection('Stalls')
        .get();

    saveName = List.from(data.docs.map((doc) => doc.get("stallID")));
    return saveName;
  }

  //path to retrieve menu details from orders with path as helping function
  Future<List<List<String>>> orderfoodName(List<String> stallID) async {
    var food = List.generate(10, (i) => List.filled(10, "", growable: true),
        growable: true);

    for (int i = 0; i < stallID.length; i++) {
      List<String> noOfFood = await _path(stallID[i], "foodName");
      for (int j = 0; j < noOfFood.length; j++) {
        food[i][j] = noOfFood[j];
        //print(food[i][j]);
      }
    }
    food.removeWhere((item) => ["", null].contains(item));
    return food;
  }

  Future<List<List<String>>> orderfoodUrl(List<String> stallID) async {
    var food = List.generate(10, (i) => List.filled(10, "", growable: true),
        growable: true);

    for (int i = 0; i < stallID.length; i++) {
      List<String> noOfFood = await _path(stallID[i], "foodImgUrl");

      for (int j = 0; j < noOfFood.length; j++) {
        food[i][j] = noOfFood[j];
        //print(food[i][j]);
      }
    }
    food.removeWhere((item) => ["", null].contains(item));
    return food;
  }

  Future<List<List<String>>> orderfoodDes(List<String> stallID) async {
    var food = List.generate(10, (i) => List.filled(10, "", growable: true),
        growable: true);

    for (int i = 0; i < stallID.length; i++) {
      List<String> noOfFood = await _path(stallID[i], "foodDetails");

      for (int j = 0; j < noOfFood.length; j++) {
        food[i][j] = noOfFood[j];
      }
    }
    food.removeWhere((item) => ["", null].contains(item));
    return food;
  }

  Future<List<List<int>>> orderfoodSize(List<String> stallID) async {
    List<List<int>> food = List.generate(
        10, (i) => List.filled(10, 0, growable: true),
        growable: true);

    for (int i = 0; i < stallID.length; i++) {
      List<int> noOfFood = await _path2(stallID[i], "quantity");

      for (int j = 0; j < noOfFood.length; j++) {
        food[i][j] = noOfFood[j];
      }
    }
    food.removeWhere((item) => ["", null].contains(item));
    return food;
  }

  Future<List<List<int>>> orderfoodPrice(List<String> stallID) async {
    List<List<int>> food = List.generate(
        10, (i) => List.filled(10, 0, growable: true),
        growable: true);

    for (int i = 0; i < stallID.length; i++) {
      List<int> noOfFood = await _path2(stallID[i], "totalPrice");

      for (int j = 0; j < noOfFood.length; j++) {
        food[i][j] = noOfFood[j];
      }
    }
    food.removeWhere((item) => ["", null].contains(item));
    return food;
  }

  Future<List<String>> _path(String stallID, String output) async {
    List<String> saveName = [];
    var data = await FirebaseFirestore.instance
        .collection('Cart')
        .doc(AuthController.userId)
        .collection('Stalls')
        .doc(stallID)
        .collection('Order')
        .get();
    //input take in List<String> then u output List<list<String>>>;
    saveName = List.from(data.docs.map((doc) => doc.get(output)));
    return saveName;
  }

  Future<List<int>> _path2(String stallID, String output) async {
    List<int> saveName = [];
    var data = await FirebaseFirestore.instance
        .collection('Cart')
        .doc(AuthController.userId)
        .collection('Stalls')
        .doc(stallID)
        .collection('Order')
        .get();
    //input take in List<String> then u output List<list<String>>>;
    saveName = List.from(data.docs.map((doc) => doc.get(output)));
    return saveName;
  }
} //class
