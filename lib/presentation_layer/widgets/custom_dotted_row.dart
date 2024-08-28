import 'package:bictov/declarations/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomDottedRow extends StatelessWidget {
  const CustomDottedRow(
      {Key? key,
      required this.length,
      required this.dashSpacing,
      required this.dashLength,
      required this.color})
      : super(key: key);
  final int length;
  final double dashSpacing;
  final double dashLength;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
          length,
          (index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: dashSpacing),
                child: Container(
                  height: 1,
                  width: dashLength,
                  decoration: BoxDecoration(
                    color: color,
                  ),
                ),
              )),
    );
  }
}
// dashSpacing 5
// dashLength 8
