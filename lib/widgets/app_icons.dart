/*
* Class created to return default size and color icons
* */
import 'package:flutter/cupertino.dart';
import 'package:hawker_buddy/utils/dimensions.dart';

class AppIcons extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  AppIcons({Key? key, required this.icon,
    this.backgroundColor = const Color(0xFFfcf4e4) ,
    this.iconColor = const Color(0xff050505),
    this.size = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundColor
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: Dimensions.iconSize16,
      ),
    );
  }
}
