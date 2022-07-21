import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hawker_buddy/data_controller.dart';
import 'package:hawker_buddy/pages/home/stallsPage.dart';
import 'package:hawker_buddy/utils/searchBar.dart';

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
            height:MediaQuery.of(context).size.height/6,
            width: MediaQuery.of(context).size.width,
            child: Center(
              //hello
              child: Container(
                width:350,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow:[
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1,1),
                          color: Colors.grey.withOpacity(0.3)
                      )]
                ),
                child: TextField(
                  //obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Search for Foods/Stalls/Canteens",
                      prefixIcon: GestureDetector(
                          onTap: () {
                            showSearch(context: context, delegate: SearchBar());
                          },
                          child: Icon(Icons.search, color: Colors.orange,)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0
                          )
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                      )
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: Dimensions.height10,),
          Container(
            /*
            decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(25),
                /*boxShadow:[BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 7,
                      offset: Offset(1,1),
                      color: Colors.grey.withOpacity(0.3)
                  )
              ]*/
            ),

            */
              child: uniqueText(text: DataController.CanteenName[0]),
          ),
          SizedBox(height: Dimensions.height10,),
          Expanded(child: SingleChildScrollView(
            child: stallsPage(),
          )),


        ],
      ),
    );
  }


}
