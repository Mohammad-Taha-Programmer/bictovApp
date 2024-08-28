import 'package:bictov/declarations/constants.dart';
import 'package:bictov/declarations/constants/strings.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image(image: AssetImage(BictovAssetsConstants.topLogo)),
        Text(
          BictovStringConstants.ictov,
          style: BictovTextStylesConstants.textStyle11,
        ),
      ],
    );
  }
}