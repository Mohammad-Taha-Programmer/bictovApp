import 'package:bictov/declarations/constants/colors.dart';
import 'package:bictov/declarations/functions/functions.dart';
import 'package:flutter/material.dart';

import '../../custom_icons/share_app_icon_icons.dart';

class WhoWeAreScreen extends StatelessWidget {
  const WhoWeAreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'من نحن', context: context),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: setHeightBasedOnXD(context, 25)),
            Align(
              alignment: Alignment.centerRight,
              child: Text('تطبيق BICTOV', textDirection: TextDirection.rtl, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: setHeightBasedOnXD(context, 19)),
            Text(' نص افتراضي  نص افتراضي  نص افتراضي  نص افتراضي  نص افتراضي  نص افتراضي  نص افتراضي  نص افتراضي  نص افتراضي  نص افتراضي  نص افتراضي  نص افتراضي نص افتراضي نص افتراضي ', textAlign: TextAlign.justify, textDirection: TextDirection.rtl),
            SizedBox(height: setHeightBasedOnXD(context, 26)),
            ExpansionTile(
              clipBehavior: Clip.none,
              shape: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              collapsedShape: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              maintainState: true,
              trailing: null,
              collapsedIconColor: BictovColors.kColor3D5A80,
              iconColor: BictovColors.kColor3D5A80,
              controlAffinity: ListTileControlAffinity.leading,
              backgroundColor: BictovColors.kColorF5F9FC,
              collapsedBackgroundColor: BictovColors.kColorF5F9FC,
              initiallyExpanded: false,
              title: const Text(
                  'آلية العمل',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight:
                      FontWeight.bold,
                      color: Colors.black
                  )),
              children: [
                Container(
                    width: getScreenWidth(context),
                    color: Colors.white,
                    height: setHeightBasedOnXD(context, 15)),
                Container(
                    alignment: Alignment.centerRight,
                    width: getScreenWidth(context),
                    color: Colors.white,
                    child: const Text('نص افتراضي نص افتراضي نص افتراضي')),
              ],
            ),
            SizedBox(height: setHeightBasedOnXD(context, 16)),
            ExpansionTile(
              clipBehavior: Clip.none,
              shape: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              collapsedShape: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              maintainState: true,
              trailing: null,
              collapsedIconColor: BictovColors.kColor3D5A80,
              iconColor: BictovColors.kColor3D5A80,
              controlAffinity: ListTileControlAffinity.leading,
              backgroundColor: BictovColors.kColorF5F9FC,
              collapsedBackgroundColor: BictovColors.kColorF5F9FC,
              initiallyExpanded: false,
              title: const Text(
                  'شروط العمل',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight:
                      FontWeight.bold,
                      color: Colors.black
                  )),
              children: [
                Container(
                    width: getScreenWidth(context),
                    color: Colors.white,
                    height: setHeightBasedOnXD(context, 15)),
                Container(
                    alignment: Alignment.centerRight,
                    width: getScreenWidth(context),
                    color: Colors.white,
                    child: const Text('نص افتراضي نص افتراضي نص افتراضي')),
              ],
            ),
            SizedBox(height: setHeightBasedOnXD(context, 16)),
            ExpansionTile(
              clipBehavior: Clip.none,
              shape: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              collapsedShape: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              maintainState: true,
              trailing: null,
              collapsedIconColor: BictovColors.kColor3D5A80,
              iconColor: BictovColors.kColor3D5A80,
              controlAffinity: ListTileControlAffinity.leading,
              backgroundColor: BictovColors.kColorF5F9FC,
              collapsedBackgroundColor: BictovColors.kColorF5F9FC,
              initiallyExpanded: false,
              title: const Text(
                  'أحكام العمل',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight:
                      FontWeight.bold,
                      color: Colors.black
                  )),
              children: [
                Container(
                    width: getScreenWidth(context),
                    color: Colors.white,
                    height: setHeightBasedOnXD(context, 15)),
                Container(
                    alignment: Alignment.centerRight,
                    width: getScreenWidth(context),
                    color: Colors.white,
                    child: const Text('نص افتراضي نص افتراضي نص افتراضي')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
