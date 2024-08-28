import 'package:bictov/declarations/constants/colors.dart';
import 'package:flutter/material.dart';

class TwoAdjacentButtons extends StatelessWidget {
   TwoAdjacentButtons({
    super.key,
     required this.buttonOneChild,
     required this.buttonTwoChild,
     required this.onPressingButtonOne,
     required this.onPressingButtonTwo,
     this.height = 70,
     this.boarderRadius = 10,
     this.buttonOneBackgroundColor = Colors.white,
     this.buttonTwoBackgroundColor = BictovColors.kColorEE6C4D,
     this.buttonBorderColor = BictovColors.kColorEE6C4D,
     this.buttonOneTextColor = Colors.black,
     this.buttonTowTextColor = Colors.white
  });

  final String buttonOneChild;
  final String buttonTwoChild;
  final double height;
  final double boarderRadius;
  final Color buttonOneBackgroundColor;
  final Color buttonTwoBackgroundColor;
  final Color buttonBorderColor;

  final Color buttonOneTextColor;
  final Color buttonTowTextColor;

  void Function()? onPressingButtonOne;
  void Function()? onPressingButtonTwo;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: MaterialButton(
              onPressed: onPressingButtonOne,
              height: height,
              color: buttonOneBackgroundColor,
              shape: OutlineInputBorder(
                borderSide: BorderSide(color: buttonBorderColor),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(boarderRadius), bottomLeft: Radius.circular(boarderRadius)),
              ),
              child: Text(buttonOneChild, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: buttonOneTextColor))
          ),
        ),
        Expanded(
          child: MaterialButton(
              onPressed: onPressingButtonTwo,
              height: height,
              color: buttonTwoBackgroundColor,
              shape: OutlineInputBorder(
                borderSide: BorderSide(color: buttonBorderColor),
                borderRadius: BorderRadius.only(topRight: Radius.circular(boarderRadius), bottomRight: Radius.circular(boarderRadius)),
              ),
              child: Text(buttonTwoChild, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: buttonTowTextColor))
          ),
        ),
      ],
    );
  }
}


