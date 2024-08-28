import 'package:bictov/declarations/constants.dart';
import 'package:bictov/declarations/constants/strings.dart';
import 'package:bictov/presentation_layer/screens/on_boarding_screen/on_boarding_pages.dart';
import 'package:flutter/material.dart';
import 'package:bictov/declarations/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  static const String widgetName = 'OnBoardingScreen';
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPageIndex = 0;

  void _onChanged(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }
  OnBoardingPages onBoardingPages = OnBoardingPages();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () async {
            SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
            sharedPreferences.setBool('onBoardingShown', true);
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){return Placeholder();}));
            },
          child: Container(
            margin: const EdgeInsets.only(left: 16.0, top: 40),
            width: 30,
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(BictovStringConstants.skippingOnBoardingText,
                    style: BictovTextStylesConstants.textStyle3)),
          ),
        ),
      ),
      body: Stack(children: [
        PageView.builder(
          controller: onBoardingPages.pageController(),
          reverse: true,
          itemCount: onBoardingPages.pagesListLength(),
          itemBuilder: (BuildContext context, int index) =>
              onBoardingPages.sliderPages(index),
          onPageChanged: _onChanged,
        ),
        Positioned(
            top: 650,
            left: 215,
            child: Column(
              children: [
                Row(
                    textDirection: TextDirection.rtl,
                    children: List<Container>.generate(
                        onBoardingPages.pagesListLength(),
                        (index) => Container(
                              margin: EdgeInsets.all(5),
                              height: 10,
                              width: index == _currentPageIndex ? 20 : 10,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: BictovColors.kColor98C1D9),
                                color: index == _currentPageIndex
                                    ? BictovColors.kColor3D5A80
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ))),
              ],
            )),
        Positioned(
          height: 100,
          width: 100,
          top: 750,
          left: 200,
          child: InkWell(
            autofocus: false,
            overlayColor: MaterialStatePropertyAll(Colors.transparent),
            onTap: () async {
              SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
              sharedPreferences.setBool('onBoardingShown', true);
              _currentPageIndex == onBoardingPages.pagesListLength() - 1
                  ? Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Placeholder()))
                  : onBoardingPages.pageController().nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear);
            },
            child: Image.asset(onBoardingPages.onBoardingImageButtons[_currentPageIndex]),
          ),
        )
      ]),
    );
  }
}
