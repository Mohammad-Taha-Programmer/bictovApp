import 'package:bictov/data_layer/api_services/authentication_services.dart';
import 'package:bictov/declarations/constants/colors.dart';
import 'package:bictov/declarations/constants/number_literals.dart';
import 'package:bictov/declarations/constants/strings.dart';
import 'package:bictov/presentation_layer/custom_icons/eye_icon_hide_password_icons.dart';
import 'package:bictov/presentation_layer/custom_icons/eye_icon_show_password_icons.dart';
import 'package:bictov/presentation_layer/screens/registration_and_authentication/user/register_user_screen.dart';
import 'package:bictov/presentation_layer/widgets/custom_text_button.dart';
import 'package:bictov/presentation_layer/widgets/custom_text_form_field.dart';
import 'package:bictov/presentation_layer/widgets/logo.dart';
import 'package:bictov/providers/register_and_auth_screens_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bictov/declarations/constants.dart';
import 'package:bictov/declarations/functions/functions.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticateUsersScreen extends StatelessWidget {
  AuthenticateUsersScreen({Key? key}) : super(key: key);
  static const widgetName = 'AuthenticateUsersScreen';
  final GlobalKey<FormState> _phoneNumberFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordFormKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool rememberMe = false;
  final Authentication authentication = Authentication();
  bool hidePassword = true;
  String countryCode = '+970';
  bool isClicked = false;
  bool isEyeIconClicked = false;
  bool obscurePassword = true;
  String verificationId = '';
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: BictovStringConstants.signIn),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: getMarginSymmetric(context, horizontalDimension: BictovNumberLiteralsConstants.nL16),
        child: Form(
          key: _phoneNumberFormKey,
          child: Column(
            children: [
              Logo(),
              SizedBox(
                height: setHeightBasedOnXD(
                  context,
                  BictovNumberLiteralsConstants.nL25,
                ),
              ),
              Text(
                BictovStringConstants.signIn,
                textAlign: TextAlign.center,
                style: BictovTextStylesConstants.textStyle4,
              ),
              SizedBox(
                height: setHeightBasedOnXD(
                  context,
                  BictovNumberLiteralsConstants.nL16,
                ),
              ),
              Text(
                BictovStringConstants.signInToContinue,
                textAlign: TextAlign.center,
                style: BictovTextStylesConstants.textStyle5,
              ),
              SizedBox(
                height: setHeightBasedOnXD(
                  context,
                  BictovNumberLiteralsConstants.nL25,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: const Text(
                  BictovStringConstants.mobileNumber,
                  style: BictovTextStylesConstants.textStyle6,
                ),
              ),
              SizedBox(
                height: setHeightBasedOnXD(
                  context,
                  BictovNumberLiteralsConstants.nL10,
                ),
              ),
              Transform.scale(
                scaleY: BictovNumberLiteralsConstants.nLScaleY,
                child: CustomTextFormField(
                  keyboardInputType: TextInputType.number,
                  hintText: BictovStringConstants.enterPhoneHint,
                  onSaved: (String? value) => _phoneController.text = value!,
                  controller: _phoneController,
                  prefixIcon: Container(
                    alignment: Alignment.center,
                    height: setHeightBasedOnXD(context, 48),
                    width: setWidthBasedOnXD(context, 82),
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: BictovColors.kColor98C1D9,
                          style: BorderStyle.solid,
                          strokeAlign: BorderSide.strokeAlignInside,
                        ),
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              BictovNumberLiteralsConstants.nL5),
                          bottomLeft: Radius.circular(
                              BictovNumberLiteralsConstants.nL5)),
                    ),
                    child: Consumer<RegisterAndAuthScreensProvider>(
                      builder: (BuildContext context,
                          RegisterAndAuthScreensProvider provider,
                          Widget? child) {
                        return DropdownButton<String>(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: BictovColors.kColor3D5A80,
                          ),
                          onChanged: (String? value) {
                            countryCode = provider.setCountryCode(value!);
                          },
                          items: [
                            DropdownMenuItem<String>(
                              child: Text('+970'),
                              value: '+970',
                            ),
                            DropdownMenuItem<String>(
                              child: Text('+972'),
                              value: '+972',
                            ),
                            DropdownMenuItem<String>(
                              child: Text('+962'),
                              value: '+962',
                            ),
                          ],
                          value: countryCode,
                          // elevation: 0,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(
                              top: BictovNumberLiteralsConstants.nL10),
                          underline: Divider(color: Colors.transparent),
                        );
                      },
                    ),
                  ),
                  suffixIcon: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 10),
                      height: setHeightBasedOnXD(context, 50),
                      width: setWidthBasedOnXD(context, 55),
                      child: CustomTextButton(
                        onPressed: () async {
                          if (_phoneNumberFormKey.currentState!.validate()) {
                            _phoneNumberFormKey.currentState!.save();

                            String phoneNumber = '$countryCode${_phoneController.text.substring(1)}';

                            bool accountExists = await authentication.authenticateUser(context: context, phone: phoneNumber);
                            if (accountExists) {
                              await auth.verifyPhoneNumber(
                                  timeout: const Duration(seconds: BictovNumberLiteralsConstants.inL40),
                                  phoneNumber: phoneNumber,
                                  verificationCompleted: (PhoneAuthCredential credential) {},
                                  verificationFailed: (FirebaseAuthException exception) {
                                    print(exception.message);
                                  },
                                  codeSent: (String verificationId, int? resendToken) async {
                                    this.verificationId = verificationId;
                                  },
                                  codeAutoRetrievalTimeout: (String verificationId) {});
                            }
                          }
                        },
                        textChild: BictovStringConstants.sendSmsCode,
                        minSizeWidth: BictovNumberLiteralsConstants.nL25,
                      )),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return BictovStringConstants.insertPhone;
                    }
                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
              SizedBox(
                height: setHeightBasedOnXD(
                  context,
                  BictovNumberLiteralsConstants.nL16,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  BictovStringConstants.verificationCode,
                  style: BictovTextStylesConstants.textStyle6,
                ),
              ),
              SizedBox(
                height: setHeightBasedOnXD(
                  context,
                  BictovNumberLiteralsConstants.nL10,
                ),
              ),
              Form(
                key: _passwordFormKey,
                child: Transform.scale(
                  scaleY: BictovNumberLiteralsConstants.nLScaleY,
                  child: Consumer<RegisterAndAuthScreensProvider>(
                    builder: (BuildContext context,
                        RegisterAndAuthScreensProvider provider,
                        Widget? child) {
                      return CustomTextFormField(
                        controller: _passwordController,
                        onSaved: (String? value) =>
                            _passwordController.text = value!,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'حقل كلمة المرور ليس اختيارياً، الرجاء ادخال كلمة المرور';
                          } else if (verificationId.isEmpty ||
                              verificationId == '') {
                            return 'الرجاء ادخال كود التحقق المرسل لرقم هاتفك';
                          }
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.singleLineFormatter,
                        ],
                        hintText: 'الرجاء قم بإدخال رمز التحقق',
                        keyboardInputType: TextInputType.visiblePassword,
                        prefixIcon: IconButton(
                          onPressed: () {
                            isEyeIconClicked =
                                provider.setEyeIconClicked(!isEyeIconClicked);
                          },
                          icon: isEyeIconClicked
                              ? Icon(EyeIconShowPassword
                                  .eye_icon_show_password_icons)
                              : Icon(EyeIconHidePassword
                                  .eye_icon_hide_password_icons),
                          iconSize: 20,
                          color: const Color(0xFF98C1D9),
                        ),
                        obscureText: !isEyeIconClicked,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: setHeightBasedOnXD(
                    context, BictovNumberLiteralsConstants.nL10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.rtl,
                children: [
                  Row(
                    children: [
                      Text('تذكرني لاحقاً'),
                      Consumer<RegisterAndAuthScreensProvider>(
                        builder: (BuildContext context,
                            RegisterAndAuthScreensProvider provider,
                            Widget? child) {
                          return Container(
                            child: Checkbox(
                              onChanged: (bool? value) {
                                rememberMe =
                                    provider.setRememberLoginValue(value!);
                              },
                              value: rememberMe,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text('نسيت كلمة المرور؟'),
                  ),
                ],
              ),
              SizedBox(
                height: setHeightBasedOnXD(
                    context, BictovNumberLiteralsConstants.nL60),
              ),
              CustomTextButton(
                onPressed: () async {
                  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                  await sharedPreferences.setBool('remember-login', rememberMe);

                  if (_passwordFormKey.currentState!.validate()) {
                    _phoneNumberFormKey.currentState!.save();
                    String smsCode = _passwordController.text;

                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                      verificationId: verificationId,
                      smsCode: smsCode,
                    );
                    await auth.signInWithCredential(credential);
                  }
                },
                textChild: BictovStringConstants.signIn,
              ),
              SizedBox(
                height: setHeightBasedOnXD(
                  context,
                  BictovNumberLiteralsConstants.nL155,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: TextDirection.rtl,
                children: [
                  Text(BictovStringConstants.doNotHaveAccount,
                      style: BictovTextStylesConstants.textStyle5,),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RegisterUserScreen.widgetName,
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: Text(
                      BictovStringConstants.doSignUp,
                      style: BictovTextStylesConstants.textStyle8,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
