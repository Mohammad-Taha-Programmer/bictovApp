import 'dart:convert';
import 'package:bictov/declarations/constants/colors.dart';
import 'package:bictov/declarations/constants/number_literals.dart';
import 'package:bictov/presentation_layer/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:bictov/presentation_layer/screens/registration_and_authentication/user/authenticate_users_screen.dart';
import 'package:bictov/presentation_layer/screens/registration_and_authentication/user/register_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:bictov/presentation_layer/home_screen.dart';
import 'package:http/http.dart' as http;

double getAvailableWidth(BuildContext context) =>
    MediaQuery.of(context).size.width -
    MediaQuery.of(context).padding.right -
    MediaQuery.of(context).padding.left;

double getAvailableHeight(BuildContext context) =>
    MediaQuery.of(context).size.height -
    AppBar().preferredSize.height -
    MediaQuery.of(context).padding.top -
    MediaQuery.of(context).padding.bottom;

EdgeInsets getMarginSymmetric(BuildContext context,
        {double horizontalDimension = 0, double verticalDimension = 0}) =>
    EdgeInsets.symmetric(
      horizontal:
          (horizontalDimension / BictovNumberLiteralsConstants.xdWidth) *
              getAvailableWidth(context),
      vertical: (verticalDimension / BictovNumberLiteralsConstants.xdHeight) *
          getAvailableHeight(context),
    );

double setHeightBasedOnXD(BuildContext context, double height) =>
    (height / BictovNumberLiteralsConstants.xdHeight) *
    getAvailableHeight(context);

double setWidthBasedOnXD(BuildContext context, double width) =>
    (width / BictovNumberLiteralsConstants.xdWidth) *
    getAvailableWidth(context);

double getScreenWidth(BuildContext context) =>
    MediaQuery.of(context).size.width;

double getScreenHeight(BuildContext context) =>
    MediaQuery.of(context).size.height;

getSize(BuildContext context) => MediaQuery.of(context).size;

Route<dynamic> navigate(RouteSettings settings) {
  switch (settings.name) {
    case OnBoardingScreen.widgetName:
      return MaterialPageRoute(
          settings: settings, builder: (BuildContext _) => OnBoardingScreen());
    case RegisterUserScreen.widgetName:
      return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext _) => RegisterUserScreen());

    case AuthenticateUsersScreen.widgetName:
      return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext _) => AuthenticateUsersScreen());
    case Home.widgetName:
      return MaterialPageRoute(
          settings: settings, builder: (BuildContext _) => const Home());
    default:
      return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext _) => Scaffold(
              appBar: AppBar(),
              body: Center(child: Text('لا يوجد ما يمكن عرضه'))));
  }
}

bool processResponseStatusCodes({
  required BuildContext context,
  required http.Response response,
  required VoidCallback goAhead,
}) {
  switch (response.statusCode) {
    case 200:
      goAhead();
      return true;
    case 400:
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(jsonDecode(response.body)["error"])));
      print(jsonDecode(response.body)["error"]);
      return false;
    case 401:
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(jsonDecode(response.body)["error"])));
      print(jsonDecode(response.body)["error"]);
      return false;
    case 500:
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(jsonDecode(response.body)["error"])));
      print(jsonDecode(response.body)["error"]);
      return false;
    default:
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(jsonDecode(response.body))));
      return false;
  }
}

// A Custom Convenient AppBar
PreferredSizeWidget? customAppBar({
  required BuildContext context,
  required String title,
  Widget? leading,
  double? rightMargin = BictovNumberLiteralsConstants.nL20,
  IconData? trailingIcon = Icons.arrow_forward_ios,
  Color trailingIconColor = BictovColors.kColor2B2B2B,
  double? iconSize,
  double? fontSize,
  bool? centerTitle = true,
}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        fontSize: fontSize ?? BictovNumberLiteralsConstants.nL16,
        fontWeight: FontWeight.bold,
        color: BictovColors.kColor2B2B2B,
      ),
    ),
    centerTitle: centerTitle,
    actions: [
      Padding(
        padding: EdgeInsets.only(
            right: rightMargin ?? BictovNumberLiteralsConstants.nL20),
        child: IconButton(
          onPressed: trailingIcon != null
              ? () => Navigator.canPop(context) ? Navigator.pop(context) : null
              : null,
          icon: Icon(
            trailingIcon ?? null,
            color: trailingIconColor,
            size: iconSize,
          ),
        ),
      ),
    ],
    leading: leading,
  );
}
