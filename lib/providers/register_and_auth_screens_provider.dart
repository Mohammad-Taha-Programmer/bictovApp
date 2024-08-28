import 'package:flutter/material.dart';
class RegisterAndAuthScreensProvider with ChangeNotifier{
    String gender = '';
    String countryCode = '';
    bool isEyeIconClicked = false;
    bool rememberMe = false;
    bool setRememberLoginValue(bool val){
      rememberMe = val;
      notifyListeners();
      return rememberMe;
    }
    String setGender(String genderValue){
      gender = genderValue;
      notifyListeners();
      return gender;
    }
    String setCountryCode(String val){
      countryCode = val;
      notifyListeners();
      return countryCode;
    }
    bool setEyeIconClicked(bool val){
      isEyeIconClicked = val;
      notifyListeners();
      return isEyeIconClicked;
    }
}