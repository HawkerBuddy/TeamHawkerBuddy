import 'package:flutter/cupertino.dart';

import '../utils/dimensions.dart';

/*
* Class created to create default bigger text
* */
class uniqueText extends StatelessWidget {
  Color? color; //optional
  final String text;
  double size;
  TextOverflow overflow;

  //use default colors must use hexadecimal cannot be variable
  uniqueText({
    Key? key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.size = 0,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontSize: size == 0 ? Dimensions.font20 : size,
          fontWeight: FontWeight.w400),
    );
  }
}
