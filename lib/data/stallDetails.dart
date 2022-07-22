import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hawker_buddy/SignIn/auth_controller.dart';

import '../utils/dimensions.dart';

class LinktoBackends {

  int index;

  LinktoBackends({required this.index});

  Stream<QuerySnapshot> name = FirebaseFirestore.instance
      .collection('Canteen')
      .doc('PGP')
      .collection('Stalls')
      .snapshots();

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

  //GET STALL ID THEN PLUG INTO GET FOOD NAME TO RETRIEVE THE CORRECT STALL MENU
  // getFoodName( getStallID() );
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
  Future<List<String>> _getFoodName(String stallID, String output) async {
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
  Future<List<List<String>>> foodName(List<String> stallID) async {
    int row = 34;
    var food  = List.generate(10, (i) => List.filled(10, "", growable: true), growable: true);

    for (int i = 0; i < stallID.length; i++) {
      List<String> noOfFood = await _getFoodName(stallID[i], "foodName");
      for (int j = 0; j < noOfFood.length; j++) {
        food[i][j] = noOfFood[j];
      }
    }
    return food;
  }
  Future<List<List<String>>> foodImgUrl(List<String> stallID) async {

    var food  = List.generate(10, (i) => List.filled(10, "", growable: true), growable: true);

    for (int i = 0; i < stallID.length; i++) {
      List<String> noOfFood = await _getFoodName(stallID[i], "image");
      for (int j = 0; j < noOfFood.length; j++) {
        food[i][j] = noOfFood[j];
      }
    }
    return food;
  }
  Future<List<List<String>>> foodPrice(List<String> stallID) async {

    var food  = List.generate(10, (i) => List.filled(10, "", growable: true), growable: true);

    for (int i = 0; i < stallID.length; i++) {
      List<String> noOfFood = await _getFoodName(stallID[i], "price");
      for (int j = 0; j < noOfFood.length; j++) {
        food[i][j] = noOfFood[j];
      }
    }
    return food;
  }
  Future<List<List<String>>> foodDes(List<String> stallID) async {

    var food  = List.generate(10, (i) => List.filled(10, "", growable: true), growable: true);

    for (int i = 0; i < stallID.length; i++) {
      List<String> noOfFood = await _getFoodName(stallID[i], "description");
      for (int j = 0; j < noOfFood.length; j++) {
        food[i][j] = noOfFood[j];
      }
    }
    return food;
  }
  Future<List<List<String>>> foodID(List<String> stallID) async {

    var food  = List.generate(10, (i) => List.filled(10, "", growable: true), growable: true);

    for (int i = 0; i < stallID.length; i++) {
      List<String> noOfFood = await _getFoodName(stallID[i], "foodId");
      //print(noOfFood.length);
      for (int j = 0; j < noOfFood.length; j++) {
        //print(j+10000);
        print(noOfFood[j]);
        food[i][j] = noOfFood[j];
        //print(food[i][j]);
      }
    }
    return food;
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





  Widget stallImage(BuildContext context) => StreamBuilder<QuerySnapshot>(
      stream: name,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('No Image Available');
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
                image: CachedNetworkImageProvider(
                    snapshot.data?.docs[index]['stallImage'])),
          ),
          /* child: CachedNetworkImage(
              imageUrl: snapshot.data?.docs[index]['stallImage'],
              fit: BoxFit.cover,
            )

             */
        );
      });

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

  Future<List<List<String>>> orderfoodName(List<String> stallID) async {

    var food  = List.generate(10, (i) => List.filled(10, "", growable: true), growable: true);

    for (int i = 0; i < stallID.length; i++) {
      List<String> noOfFood = await _path(stallID[i], "foodName");
      for (int j = 0; j < noOfFood.length; j++) {
        food[i][j] = noOfFood[j];
        //print(food[i][j]);
      }
    }
    return food;
  }

  Future<List<List<String>>> orderfoodUrl(List<String> stallID) async {

    var food  = List.generate(10, (i) => List.filled(10, "", growable: true), growable: true);

    for (int i = 0; i < stallID.length; i++) {
      List<String> noOfFood = await _path(stallID[i], "foodImgUrl");

      for (int j = 0; j < noOfFood.length; j++) {
        food[i][j] = noOfFood[j];
        //print(food[i][j]);
      }
    }
    return food;
  }

  Future<List<List<String>>> orderfoodDes(List<String> stallID) async {

    var food  = List.generate(10, (i) => List.filled(10, "", growable: true), growable: true);

    for (int i = 0; i < stallID.length; i++) {
      List<String> noOfFood = await _path(stallID[i], "foodDetails");

      for (int j = 0; j < noOfFood.length; j++) {
        food[i][j] = noOfFood[j];
      }
    }
    return food;
  }

  Future<List<List<int>>> orderfoodSize(List<String> stallID) async {

    List<List<int>> food  = List.generate(10, (i) => List.filled(10, 0, growable: true), growable: true);

    for (int i = 0; i < stallID.length; i++) {
      List<int> noOfFood = await _path2(stallID[i], "quantity");

      for (int j = 0; j < noOfFood.length; j++) {
        food[i][j] = noOfFood[j];
      }
    }
    return food;
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
