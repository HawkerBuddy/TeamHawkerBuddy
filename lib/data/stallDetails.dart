import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../utils/dimensions.dart';

class textStallYIH {
  int index;

  textStallYIH({required this.index});

  Stream<QuerySnapshot> name = FirebaseFirestore.instance
      .collection('Canteen')
      .doc('PGP')
      .collection('Stalls')
      .snapshots();

  Stream<QuerySnapshot> dish = FirebaseFirestore.instance
      .collection('Canteen')
      .doc('PGP')
      .collection('Stalls')
      .doc('Stall1')
      .collection('menu')
      .snapshots();

  Widget canteenName(BuildContext context) => StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Canteen').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading data..');
        }
        return Text(snapshot.data?.docs[index]['name'],
            style: new TextStyle(fontSize: 20.0));
      });

  Widget stallName(BuildContext context) => StreamBuilder<QuerySnapshot>(
      stream: name,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading');
        }
        return Text(snapshot.data?.docs[index]['StallName']);
      });

  Widget stallDescription(BuildContext context) => StreamBuilder<QuerySnapshot>(
      stream: name,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading');
        }
        return Text(snapshot.data?.docs[index]['description']);
      });

  Widget dishName(BuildContext context) => StreamBuilder<QuerySnapshot>(
      stream: dish,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading');
        }

        final data = snapshot.requireData;

        return ListView.builder(
            itemCount: data.size,
            itemBuilder: (context, index) {
              return Text(data.docs[index]['foodName']);
            });
        //return Text(snapshot.data?.docs[index]['foodId']);
      });

  //function fixed
  Widget stallImage(BuildContext context) => StreamBuilder<QuerySnapshot>(
      stream: name,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('No Image Available');
        }
        return Container(
          //margins and overall looks for slider
          height: Dimensions.pageViewContainer,
          margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
          //child:img.stallImage(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius25),
            //color: index.isEven? Color(0xffe2cc33): Color(0xFFFF9500),
            //image widget to insert picture
            image: DecorationImage(
                fit:BoxFit.cover,
                image: CachedNetworkImageProvider(snapshot.data?.docs[index]['stallImage'])
            ),
          ),
            /* child: CachedNetworkImage(
              imageUrl: snapshot.data?.docs[index]['stallImage'],
              fit: BoxFit.cover,
            )
             */
        );



      });

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

} //class
