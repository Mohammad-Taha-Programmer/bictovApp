import 'package:bictov/declarations/constants/colors.dart';
import 'package:bictov/declarations/constants/number_literals.dart';
import 'package:flutter/material.dart';

const String ipv4 = "192.168.1.2";
const int port = 5030;
const String appUri = 'http://${ipv4}:${port}';
const String bictovUserTokenHeader = 'x-bictov-authentication-token';

const Widget customLeftWidget = Icon(
  Icons.arrow_back_ios,
  color: BictovColors.kColor3D5A80,
  size: 13,
);


class BictovTextStylesConstants{
  static const TextStyle textStyle1 = TextStyle(
    fontSize: BictovNumberLiteralsConstants.nL15,
    fontWeight: FontWeight.normal,
    color: BictovColors.kColor2B2B2B,
  );

  static const TextStyle textStyle2 = TextStyle(
    fontSize: BictovNumberLiteralsConstants.nL16,
    fontWeight: FontWeight.bold,
    color: BictovColors.kColor2B2B2B,
    height: BictovNumberLiteralsConstants.nL1_5,
  );

  static const TextStyle textStyle3 = TextStyle(
    fontSize: BictovNumberLiteralsConstants.nL12,
    color: BictovColors.kColor3B3B3B,
  );

  static const TextStyle textStyle4 = TextStyle(
    fontSize: BictovNumberLiteralsConstants.nL16,
    color: BictovColors.kColor2B2B2B,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle textStyle5 = TextStyle(
    color: BictovColors.kColor3B3B3B,
    fontWeight: FontWeight.normal,
    fontSize: BictovNumberLiteralsConstants.nL13,
  );

  static const TextStyle textStyle6 = TextStyle(
    fontSize: BictovNumberLiteralsConstants.nL13,
    fontWeight: FontWeight.normal,
    color: BictovColors.kColor2B2B2B,
  );

  static const TextStyle textStyle7 = TextStyle(
    color: Colors.white,
    fontSize: BictovNumberLiteralsConstants.nL14,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle textStyle8 = TextStyle(
      color: BictovColors.kColor3D5A80,
      fontSize: BictovNumberLiteralsConstants.nL13,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline
  );

  static const TextStyle textStyle9 = TextStyle(
    fontSize: BictovNumberLiteralsConstants.nL16,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle textStyle10 = TextStyle(
    fontSize: BictovNumberLiteralsConstants.nL13,
    fontWeight: FontWeight.normal,
    color: Colors.black,);

  static const TextStyle textStyle11 = TextStyle(
    fontSize: BictovNumberLiteralsConstants.nL16,
    color: BictovColors.kColor293241,
    fontWeight: FontWeight.bold,);

  static const TextStyle textStyle12 = TextStyle(
    color: BictovColors.kColor2B2B2B,
    fontSize: BictovNumberLiteralsConstants.nL14,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle textStyle13 = TextStyle(
    color: BictovColors.kColor2B2B2B,
    fontSize: BictovNumberLiteralsConstants.nL16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle textStyle14 = TextStyle(
    fontSize: BictovNumberLiteralsConstants.nL16,
    fontWeight: FontWeight.w500,
    color: BictovColors.kColor2B2B2B,
    height: BictovNumberLiteralsConstants.nL1_5,
  );

  static const TextStyle textStyle15 = TextStyle(
      color: BictovColors.kColor393939,
      fontSize: BictovNumberLiteralsConstants.nL13,
  );

}

class BictovAssetsConstants{
  // For Asset constants like image, fonts etc...
  static const String topLogo = "assets/images/register_and_auth_user_screens/top_logo.png";

}

