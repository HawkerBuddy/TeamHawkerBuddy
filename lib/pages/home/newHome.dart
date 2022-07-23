import 'package:flutter/material.dart';
import 'package:hawker_buddy/controllers/data_controller.dart';
import 'package:hawker_buddy/pages/home/stallsPage.dart';
import 'package:hawker_buddy/controllers/search_controller.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/unique_text.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppColors.mainColor,
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width,
            child: Center(
              //hello
              child: Container(
                width: Dimensions.width350,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: Dimensions.radius10,
                          spreadRadius: Dimensions.radius10*0.7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.3))
                    ]),
                child: TextField(
                  //obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Search for Foods/Stalls/Canteens",
                      prefixIcon: GestureDetector(
                          onTap: () {
                            showSearch(context: context, delegate: SearchBar());
                          },
                          child: Icon(
                            Icons.search,
                            color: AppColors.mainColor,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Dimensions.radius30),
                          borderSide:
                              BorderSide(color: Colors.white, width: Dimensions.width10/10)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Dimensions.radius30),
                          borderSide:
                              BorderSide(color: Colors.white, width: Dimensions.width10/10)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Dimensions.radius30))),
                ),
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          uniqueText(text: DataController.CanteenName[0]),
          SizedBox(
            height: Dimensions.height10,
          ),
          const Expanded(
              child: SingleChildScrollView(
            child: stallsPage(),
          )),
        ],
      ),
    );
  }
}
