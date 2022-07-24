import 'package:flutter/material.dart';
import 'package:hawker_buddy/utils/colors.dart';
import 'package:hawker_buddy/utils/dimensions.dart';
import 'package:hawker_buddy/widgets/expandable_food.dart';
import 'package:hawker_buddy/widgets/unique_text.dart';

import '../../widgets/app_icons.dart';

class MessageApp extends StatefulWidget {
  const MessageApp({Key? key}) : super(key: key);

  @override
  State<MessageApp> createState() => _MessageAppState();
}

class _MessageAppState extends State<MessageApp> {
  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: listView(),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      backgroundColor: AppColors.mainColor,
      title: uniqueText(
        text: 'Notifications',
      ),
    );
  }

  Widget listView() {
    return ListView.separated(
        itemBuilder: (context, index) {
          return listViewItem(index);
        },
        separatorBuilder: (context, index) {
          return const Divider(height: 5);
        },
        itemCount: 1);
  }

  Widget listViewItem(int index) {
    return Container(
      //color: Colors.blue,
      margin: const EdgeInsets.only(left: 10),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Dimensions.height10),
          message(index),
          SizedBox(height: Dimensions.height10),
          timeAndDate(index),
        ],
      ),
    );
  }

  Widget message(index) {
    return const ExpandableFood(text: "Hi please confirm your order");
  }

  Widget timeAndDate(int index) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppIcons(
              icon: Icons.circle,
              size: 20,
              backgroundColor: Colors.red,
              iconColor: Colors.red),
          SizedBox(width: Dimensions.width30),
          uniqueText(text: "27/6 1200pm"),
        ],
      ),
    );
  }
}
