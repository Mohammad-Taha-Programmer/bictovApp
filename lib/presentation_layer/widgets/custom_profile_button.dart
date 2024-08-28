import 'package:bictov/declarations/constants/colors.dart';
import 'package:bictov/declarations/constants.dart';
import 'package:bictov/declarations/functions/functions.dart';
import 'package:flutter/material.dart';

class CustomThreePartsButton extends StatelessWidget {
  CustomThreePartsButton(
      this.textLabel, this.customRightIcon, this.customLeftWidget, this.onTap);
  final VoidCallback onTap;
  final String textLabel;
  final IconData customRightIcon;
  final Widget customLeftWidget;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: BictovColors.kColorF5F9FC,
            borderRadius: BorderRadius.circular(10.0)),
        width: (0.9147) * getAvailableWidth(context),
        height: (0.06) * getAvailableHeight(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(padding: EdgeInsets.all(15.0), child: customLeftWidget),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(textLabel,
                        style: BictovTextStylesConstants.textStyle6,
                        textDirection: TextDirection.rtl))),
            SizedBox(width: (0.032) * getAvailableWidth(context)),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0, right: 15.0, top: 10),
              child: Icon(
                customRightIcon,
                color: BictovColors.kColor3D5A80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
