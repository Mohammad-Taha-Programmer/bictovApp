import 'package:bictov/presentation_layer/screens/on_boarding_screen/on_boarding_slider.dart';
import 'package:flutter/material.dart';


class OnBoardingPages
{
  final PageController _controller = PageController(viewportFraction: 1, keepPage: true);
  //final controller = PageController(viewportFraction: 1, keepPage: true);

  static final String _onBoardingImage_1 = 'assets/images/on_boarding_screen/on_boarding_image_1.png';
  static final String _onBoardingImage_2 = 'assets/images/on_boarding_screen/on_boarding_image_2.png';
  static final String _onBoardingImage_3 = 'assets/images/on_boarding_screen/on_boarding_image_3.png';

  List<String> onBoardingImageButtons = [
    'assets/images/on_boarding_screen/on_boarding_button_image_1.png',
    'assets/images/on_boarding_screen/on_boarding_button_image_2.png',
    'assets/images/on_boarding_screen/on_boarding_button_image_3.png'
  ];


  static final String _title1_1 = 'أفضل الخصومات';
  static final String _title1_2 = 'توافر الخريطة';
  static final String _title1_3 = 'توافر أكثر من وسيلة دفع';

  static final String _description_1 = 'يوفر التطبيق العديد من الخصومات والعروض في العديد من المتاجر';
  static final String _description_2 = 'يوفر التطبيق خريطة للتسهيل خلال عملية البحث\n على المتاجر القريبة، وحفظهم';
  static final String _description_3 = 'يوفر التطبيق أكثر من وسيلة دفع للتسهيل على\n الزبون';

  final List<Widget> _pages =
  [
    SliderPage(image: _onBoardingImage_1, title: _title1_1, description: _description_1),
    SliderPage(image: _onBoardingImage_2, title: _title1_2, description: _description_2,),
    SliderPage(image: _onBoardingImage_3, title: _title1_3, description: _description_3,),
  ];

  Widget sliderPages(int index) => _pages[index];
  int pagesListLength() => _pages.length;
  PageController pageController() => _controller;
}
