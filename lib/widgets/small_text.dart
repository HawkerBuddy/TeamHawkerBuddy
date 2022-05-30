/*
* Class created to create default small texts
* */

import 'package:flutter/cupertino.dart';

class miniText extends StatelessWidget {

  Color? color; //optional
  final String text;
  double size;
  double height;

  //use default colors must use hexadecimal cannot be variable
  miniText({Key? key, this.color  = const Color(0xFF332d2b),
    required this.text,
    this.size = 12,
    this.height=1.2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontSize: size,
          height: height
      ),
    );
  }
}
