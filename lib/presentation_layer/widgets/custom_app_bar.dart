import 'package:bictov/declarations/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key, required this.title,
  });
  final String title;
  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: BictovColors.kColor2B2B2B),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              color: BictovColors.kColor2B2B2B,
            ),
          ),
        ),
      ],
    );
  }
}