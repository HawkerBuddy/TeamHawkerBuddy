/*
* Class created to create default icons with text
* */
import 'package:flutter/cupertino.dart';
import 'package:hawker_buddy/widgets/small_text.dart';

class  IconsAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconsAndText({Key? key,
        required this.icon,
        required this.text,
        required this.iconColor
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor,),
        SizedBox(width: 5,),
        miniText(text: text,),
      ],
    ); //Row
  }
}
