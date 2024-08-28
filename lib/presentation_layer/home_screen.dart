import 'package:bictov/data_layer/models/user_model.dart';
import 'package:bictov/declarations/constants/colors.dart';
import 'package:bictov/declarations/constants.dart';
import 'package:bictov/presentation_layer/custom_icons/notifications_icons.dart';
import 'package:bictov/presentation_layer/custom_icons/search_icon_icons.dart';
import 'package:bictov/presentation_layer/widgets/custom_text_form_field.dart';
import 'package:bictov/providers/user_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bictov/declarations/functions/functions.dart';
import 'dart:ui' as ui;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const String widgetName = 'home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String profileImage = '';
  PageController pViewController =
      PageController(viewportFraction: 0.8, initialPage: 0, keepPage: true);

  List<Widget> ads = [
    Stack(
      children: [
        Container(child: Image.asset('assets/images/ads_temporary/ad1.png')),
        Positioned(
          top: 75,
          left: 20,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaY: 10, sigmaX: 8),
                child: MaterialButton(
                  onPressed: () {},
                  //color: BictovColors.kColor707070.withOpacity(.5),
                  child: const Text('اشتري الآن',
                      style: const TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ),
        ),
        BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: 8.0,
            sigmaY: 8.0,
          ),
        )
      ],
    ),
    Stack(
      children: [
        Container(
            child: Image.asset(
          'assets/images/ads_temporary/ad2.png',
        )),
        Positioned(
          top: 75,
          left: 20,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaY: 10, sigmaX: 8),
                child: MaterialButton(
                  onPressed: () {},
                  //color: BictovColors.kColor707070.withOpacity(.5),
                  child: const Text('اشتري الآن',
                      style: const TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ),
        ),
        BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: 8.0,
            sigmaY: 8.0,
          ),
        )
      ],
    ),
    Stack(
      children: [
        Container(
            child: Image.asset(
          'assets/images/ads_temporary/ad3.png',
        )),
        Positioned(
          top: 75,
          left: 20,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaY: 10, sigmaX: 8),
                child: MaterialButton(
                  onPressed: () {},
                  //color: BictovColors.kColor707070.withOpacity(.5),
                  child: const Text('اشتري الآن',
                      style: const TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ),
        ),
        BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: 8.0,
            sigmaY: 8.0,
          ),
        )
      ],
    ),
  ];

  List<BictovUser>? _newBusinessList;
  List<BictovUser>? _bestBusinessesList;
  List<BictovUser>? _businessesWithOffersList;
  List<BictovUser>? _businessesCloseToUserList;

  GlobalKey<FormState> _searchFormKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    final BictovUser bictovUser =
        Provider.of<UserModelProvider>(context, listen: false).bictovUser;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Text('${bictovUser.name}',
                    style: TextStyle(color: Colors.black, fontSize: 13),
                    textDirection: TextDirection.rtl),
                Text('أهلاً،  ',
                    style: TextStyle(color: Colors.black, fontSize: 13),
                    textDirection: TextDirection.rtl),
              ],
            ),
          ),
          SizedBox(width: setWidthBasedOnXD(context, 10)),
          GestureDetector(
            onDoubleTap: () async {},
            child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: BictovColors.kColor98C1D9)),
                margin: EdgeInsets.only(right: 13, top: 13),
                child: bictovUser.profilePicture != null &&
                        bictovUser.profilePicture != ''
                    ? Image.network(bictovUser.profilePicture.toString())
                    : CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/temp_avatar.png'))),
          ),
        ],
        leading:
            Icon(Notifications.notifications, color: BictovColors.kColor98C1D9),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: setHeightBasedOnXD(context, 110),
                width: double.infinity,
                child: PageView.builder(
                  allowImplicitScrolling: true,
                  reverse: true,
                  dragStartBehavior: DragStartBehavior.start,
                  scrollBehavior: ScrollBehavior(),
                  physics: AlwaysScrollableScrollPhysics(),
                  pageSnapping: true,
                  controller: pViewController,
                  scrollDirection: Axis.horizontal,
                  itemCount: ads.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ads[index];
                  },
                ),
              ),
              SizedBox(height: setHeightBasedOnXD(context, 40)),
              Form(
                key: _searchFormKey,
                child: CustomTextFormField(
                  hintText: 'ابحث عن أي متجر أو منتج تريده',
                  validator: (String? searchWord) {
                    if (searchWord == '' || searchWord == null) {
                      return 'الرجاء ادخال كلمة بحث';
                    }
                    return null;
                  },
                  onSubmit: (String searchWord) {},
                  inputFormatters: [],
                  fillColor: BictovColors.kColorF9F9F9,
                  enabledBorderColor: Colors.white,
                  suffixIcon: Icon(SearchIcon.search_icon,
                      color: BictovColors.kColor707070),
                ),
              ),
              SizedBox(height: setHeightBasedOnXD(context, 26)),
              Container(
                  width: double.infinity,
                  child: Text(
                    'متاجر جديدة',
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: BictovTextStylesConstants.textStyle2,
                  )),
              SizedBox(height: setHeightBasedOnXD(context, 13)),
              BusinessCardsList(storesList: _newBusinessList),
              const SizedBox(height: 20),
              Stack(
                children: [
                  Image.asset('assets/images/home_pic.png'),
                  Positioned(
                    top: 150,
                    left: 230,
                    child: MaterialButton(
                      onPressed: () {},
                      color: BictovColors.kColor98C1D9,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(color: Colors.transparent)),
                      child: const Text('إنشاء حساب',
                          style: const TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                  width: double.infinity,
                  child: Text(
                    'أفضل المتاجر',
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: BictovTextStylesConstants.textStyle2,
                  )),
              BusinessCardsList(storesList: _bestBusinessesList),
              const SizedBox(height: 20),
              Container(
                  width: double.infinity,
                  child: Text(
                    'المتاجر التي يوجد فيها عروض',
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: BictovTextStylesConstants.textStyle2,
                  )),
              BusinessCardsList(storesList: _businessesWithOffersList),
              const SizedBox(height: 20),
              Container(
                  width: double.infinity,
                  child: Text(
                    'المتاجر القريبة منك',
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: BictovTextStylesConstants.textStyle2,
                  )),
              BusinessCardsList(storesList: _businessesCloseToUserList),
            ],
          ),
        ),
      ),
    );
  }
}

class BusinessCardsList extends StatelessWidget {
  const BusinessCardsList({super.key, required this.storesList});
  final List<BictovUser>? storesList;

  @override
  Widget build(BuildContext context) {
    return storesList == null
        ? Center(child: CircularProgressIndicator())
        : SizedBox(
            height: setHeightBasedOnXD(context, 210),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                reverse: true,
                itemCount: storesList!.length,
                physics: ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector();
                }),
          );
  }
}
