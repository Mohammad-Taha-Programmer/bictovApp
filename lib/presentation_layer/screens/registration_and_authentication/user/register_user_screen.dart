import 'package:bictov/data_layer/api_services/authentication_services.dart';
import 'package:bictov/data_layer/api_services/registration_services.dart';
import 'package:bictov/declarations/constants/colors.dart';
import 'package:bictov/declarations/constants/number_literals.dart';
import 'package:bictov/declarations/constants/strings.dart';
import 'package:bictov/presentation_layer/custom_icons/eye_icon_hide_password_icons.dart';
import 'package:bictov/presentation_layer/custom_icons/eye_icon_show_password_icons.dart';
import 'package:bictov/presentation_layer/screens/registration_and_authentication/user/authenticate_users_screen.dart';
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

class RegisterUserScreen extends StatelessWidget {
  RegisterUserScreen({Key? key}) : super(key: key);
  static const String widgetName = 'RegisterUser';
  final GlobalKey<FormState> _registerUserFormKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _phoneNumberFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordFormKey = GlobalKey<FormState>();

  final Authentication authentication = Authentication();
  final FirebaseAuth auth = FirebaseAuth.instance;
  String genderChoice = '';
  Registration registration = Registration();
  bool hidePassword = true;
  String countryCode = '+970';
  bool isEyeIconClicked = false;
  String verificationId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: BictovStringConstants.signUp,
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: getMarginSymmetric(
          context,
          horizontalDimension: BictovNumberLiteralsConstants.nL16,
        ),
        child: Form(
          key: _registerUserFormKey,
          child: Column(
            children: [
              ///////////////// Done /////////////////////
              Logo(),
              SizedBox(
                height: setHeightBasedOnXD(
                  context,
                  BictovNumberLiteralsConstants.nL25,
                ),
              ),
              Text(
                BictovStringConstants.signUp,
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
                BictovStringConstants.FillAccountDetails,
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
                  BictovStringConstants.fullName,
                  style: BictovTextStylesConstants.textStyle6,
                ),
              ),
              SizedBox(
                height: setHeightBasedOnXD(
                  context,
                  BictovNumberLiteralsConstants.nL10,
                ),
              ),
              //--------NAME---------//
              Transform.scale(
                scaleY: BictovNumberLiteralsConstants.nLScaleY,
                child: CustomTextFormField(
                  hintText: BictovStringConstants.enterNameHint,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return BictovStringConstants.insertName;
                    }
                    return null;
                  },
                  controller: _nameController,
                  onSaved: (String? value) => _nameController.text = value!,
                  inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                ),
              ),
              //-----------------//
              SizedBox(
                height: setHeightBasedOnXD(
                  context,
                  BictovNumberLiteralsConstants.nL16,
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
              //--------PHONE----------//
              Form(
                key: _phoneNumberFormKey,
                child: Transform.scale(
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
                            topLeft: Radius.circular(BictovNumberLiteralsConstants.nL5),
                            bottomLeft: Radius.circular(BictovNumberLiteralsConstants.nL5)),
                      ),
                      child: Consumer<RegisterAndAuthScreensProvider>(
                        builder: (BuildContext context, RegisterAndAuthScreensProvider provider, Widget? child) {
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
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: BictovNumberLiteralsConstants.nL10),
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


                                registration.verifyUserExists(context: context, phone: phoneNumber);

                                // await auth.verifyPhoneNumber(
                                //   timeout: const Duration(seconds: BictovNumberLiteralsConstants.inL40),
                                //   phoneNumber: phoneNumber,
                                //   verificationCompleted: (PhoneAuthCredential credential) {},
                                //   verificationFailed: (FirebaseAuthException exception) {
                                //     print(exception.message);
                                //   },
                                //   codeSent: (String verificationId, int? resendToken) async {
                                //     this.verificationId = verificationId;
                                //   },
                                //   codeAutoRetrievalTimeout: (String verificationId) {},
                                // );
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
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
              ),
              //-----------------------//
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
                            return BictovStringConstants.insertPassCode;
                          } else if (verificationId.isEmpty ||
                              verificationId == '') {
                            return BictovStringConstants
                                .plzInsertVerificationCode;
                          }
                          return null;
                        },
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.singleLineFormatter
                        ],
                        hintText:
                            BictovStringConstants.enterVerificationCodeHint,
                        keyboardInputType: TextInputType.visiblePassword,
                        prefixIcon: IconButton(
                          onPressed: () => isEyeIconClicked =
                              provider.setEyeIconClicked(!isEyeIconClicked),
                          icon: isEyeIconClicked
                              ? Icon(EyeIconShowPassword
                                  .eye_icon_show_password_icons)
                              : Icon(EyeIconHidePassword
                                  .eye_icon_hide_password_icons),
                          iconSize: BictovNumberLiteralsConstants.nL20,
                          color: BictovColors.kColor98C1D9,
                        ),
                        obscureText: !isEyeIconClicked,
                      );
                    },
                  ),
                ),
              ),


              SizedBox(
                height: setHeightBasedOnXD(
                  context,
                  BictovNumberLiteralsConstants.nL20,
                ),
              ),
              const Align(
                alignment: Alignment.topRight,
                child: Text(
                  BictovStringConstants.sex,
                  style: BictovTextStylesConstants.textStyle15,
                ),
              ),
              SizedBox(
                height: setHeightBasedOnXD(
                  context,
                  BictovNumberLiteralsConstants.nL11,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      const Text(BictovStringConstants.male),
                      Consumer<RegisterAndAuthScreensProvider>(
                        builder: (context, userModelProvider, child) {
                          return Radio(
                            value: BictovStringConstants.male,
                            groupValue: genderChoice,
                            onChanged: (gender) {
                              genderChoice =
                                  userModelProvider.setGender(gender!);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    width: setWidthBasedOnXD(
                      context,
                      BictovNumberLiteralsConstants.nL54,
                    ),
                  ),
                  Row(
                    children: [
                      const Text(BictovStringConstants.female),
                      Consumer<RegisterAndAuthScreensProvider>(
                        builder: (context, userModelProvider, child) {
                          return Radio(
                            value: BictovStringConstants.female,
                            groupValue: genderChoice,
                            onChanged: (gender) {
                              genderChoice =
                                  userModelProvider.setGender(gender!);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(
                height: setHeightBasedOnXD(
                  context,
                  BictovNumberLiteralsConstants.nL48,
                ),
              ),
              ////////////////////////////////////////////////////

              CustomTextButton(
                onPressed: () async {
                  if (_passwordFormKey.currentState!.validate() &&
                      _registerUserFormKey.currentState!.validate()) {
                    _passwordFormKey.currentState!.save();
                    _registerUserFormKey.currentState!.save();
                    String smsCode = _passwordController.text;
                    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
                    // await auth.signInWithCredential(credential);
                  }
                },
                textChild: BictovStringConstants.signUp,
              ),

              SizedBox(
                height: setHeightBasedOnXD(
                  context,
                  BictovNumberLiteralsConstants.nL37,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    BictovStringConstants.haveAccount,
                    style: BictovTextStylesConstants.textStyle5,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AuthenticateUsersScreen.widgetName,
                        (route) => false,
                      );
                    },
                    child: Text(
                      BictovStringConstants.doLogIn,
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
