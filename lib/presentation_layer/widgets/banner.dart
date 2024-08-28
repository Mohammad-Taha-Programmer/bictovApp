import 'package:flutter/material.dart';

class ScreenBanner extends StatelessWidget {
  const ScreenBanner({
    super.key, required this.screenName,
  });
  final String screenName;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text('Screen Name: $screenName', textAlign: TextAlign.center,),
    );
  }
}