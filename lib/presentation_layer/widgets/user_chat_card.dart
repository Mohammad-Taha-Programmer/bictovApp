import 'package:bictov/declarations/constants/colors.dart';
import 'package:bictov/declarations/functions/functions.dart';
import 'package:flutter/material.dart';
class UserChatCard extends StatelessWidget {
  const UserChatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: setHeightBasedOnXD(context, 48),
      width: setWidthBasedOnXD(context, 186),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
        color: BictovColors.kColor3D5A80,
      ),
      child: Text('مرحبا، عندي استفسار'),
    );
  }
}
