import 'package:flutter/material.dart';
import 'package:hawker_buddy/widgets/small_text.dart';
import 'package:hawker_buddy/widgets/unique_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'icon_and_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //aligning y axis
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        uniqueText(text: text, size: Dimensions.font15),
        //SizedBox(height:10),
        //SizedBox(height: Dimensions.height5),
        Row(
          children: [
            Wrap(
                //creating a list of children
                children: List.generate(
                    5,
                    (index) => Icon(
                          Icons.star,
                          color: AppColors.mainColor,
                          size: Dimensions.font15,
                        ))),
            SizedBox(width: Dimensions.width10),
            miniText(text: "5"),
            SizedBox(width: Dimensions.width10),
            miniText(text: "9873"),
            SizedBox(width: Dimensions.width10),
            miniText(text: "reviews")
          ],
        ),
        SizedBox(height: Dimensions.height5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            IconsAndText(
              icon: Icons.circle_sharp,
              text: "Open",
              iconColor: AppColors.iconshopopen,
            ),
            IconsAndText(
              icon: Icons.location_on,
              text: "100km",
              iconColor: AppColors.iconlocation,
            ),
            IconsAndText(
              icon: Icons.access_time_rounded,
              text: "20min",
              iconColor: AppColors.iconque,
            )
          ],
        ),
      ],
    );
  }
}
