import 'package:bictov/declarations/constants.dart';
import 'package:bictov/declarations/constants/colors.dart';
import 'package:bictov/declarations/constants/number_literals.dart';
import 'package:bictov/declarations/functions/functions.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton({
    super.key,
    required this.onPressed,
    this.backgroundColor = BictovColors.kColorEE6C4D,
    this.boarderSideColor = BictovColors.kColorEE6C4D,
    required this.textChild,
    this.styleNumber = 7,
    this.minSizeWidth = BictovNumberLiteralsConstants.nL227,
    this.minSizeHeight = BictovNumberLiteralsConstants.nL48,
  });

  final void Function()? onPressed;
  Color? backgroundColor;
  Color? boarderSideColor;
  final String textChild;
  double? minSizeWidth;
  double? minSizeHeight;
  int? styleNumber;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: Size(
          setWidthBasedOnXD(context, minSizeWidth!),
          setHeightBasedOnXD(context, minSizeHeight!),
        ),
        backgroundColor: backgroundColor,
        side: BorderSide(color: boarderSideColor!),
        alignment: Alignment.center,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: BictovNumberLiteralsConstants.nL5),
        child: Text(
          textAlign: TextAlign.center,
          textChild,
          style: styleNumber == BictovNumberLiteralsConstants.nL7
              ? BictovTextStylesConstants.textStyle7
              : BictovTextStylesConstants.textStyle12,
        ),
      ),
    );
  }
}
