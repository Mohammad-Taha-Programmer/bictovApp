import 'package:flutter/material.dart';
import 'package:bictov/declarations/functions/functions.dart';
import 'package:bictov/declarations/constants.dart';

class SliderPage extends StatelessWidget {

  final String image;
  final String title;
  final String description;

  SliderPage({required this.image, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: setHeightBasedOnXD(context,70)),
        Container(
            child: Image.asset(image, width: setWidthBasedOnXD(context,  283,)),
            margin: getMarginSymmetric(context,horizontalDimension:  46)),
        SizedBox(height: setHeightBasedOnXD(context, 61)),
        Text(title,
            textAlign: TextAlign.center,
            style: BictovTextStylesConstants.textStyle2),
        SizedBox(height: setHeightBasedOnXD(context, 19)),
        Container(
            margin: getMarginSymmetric(context,horizontalDimension:  25),
            child: Text(description,
                textAlign: TextAlign.center,
                style: BictovTextStylesConstants.textStyle1)),
        SizedBox(height: setHeightBasedOnXD(context, 50)),
      ],
    );
    // return Container(
    //   height: getAvailableHeight(context),
    //   color: BictovColors.kColorWhite,
    //   child: Column(
    //     children: [
    //       SizedBox(height: setHeightBasedOnXD(70, context)),
    //       Container(
    //           child: Image.asset(image, width: setWidthBasedOnXD(283, context)),
    //           margin: getMarginSymmetric(46, context)),
    //       SizedBox(height: setHeightBasedOnXD(61, context)),
    //       Text(title,
    //           textAlign: TextAlign.center,
    //           style: BictovConstants.sliderTitleStyle),
    //       SizedBox(height: setHeightBasedOnXD(19, context)),
    //       Container(
    //           margin: getMarginSymmetric(25, context),
    //           child: Text(description,
    //               textAlign: TextAlign.center,
    //               style: BictovConstants.sliderDescriptionStyle)),
    //       //SizedBox(height: setHeightBasedOnXD(50, context)),
    //     ],
    //   ),
    // );
  }
}
