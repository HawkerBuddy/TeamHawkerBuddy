import 'package:flutter/material.dart';
import 'package:hawker_buddy/utils/dimensions.dart';
import 'package:hawker_buddy/widgets/small_text.dart';

class ExpandableFood extends StatefulWidget {
  const ExpandableFood({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  State<ExpandableFood> createState() => _ExpandableFoodState();
}

class _ExpandableFoodState extends State<ExpandableFood> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: secondHalf.isEmpty
            ? miniText(
                size: Dimensions.font15, color: Colors.grey, text: firstHalf)
            : Column(
                children: [
                  miniText(
                      size: Dimensions.font15,
                      color: Colors.grey,
                      text: hiddenText
                          ? ("$firstHalf...")
                          : (firstHalf + secondHalf)),
                  InkWell(
                    onTap: () {
                      setState(() {
                        hiddenText = !hiddenText;
                      });
                    },
                    child: Row(
                      children: [
                        miniText(
                          text: "Show More",
                          color: Colors.lightBlue,
                        ),
                        Icon(
                          hiddenText
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: Colors.lightBlue,
                        ),
                      ],
                    ),
                  ),
                ],
              ));
  }
}
