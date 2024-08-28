import 'package:bictov/data_layer/models/user_model.dart';
import 'package:flutter/material.dart';

class UserModelProvider with ChangeNotifier {
    // create an empty private variable to hold an empty BictovUser object to fill it later
    BictovUser _bictovUser = BictovUser.newEmptyUser();
    // create a getter to return the private object variable
    BictovUser get bictovUser => _bictovUser;
    // create a method to receive a json string and convert it to a user object using the model methods.
    void setBictovUserData(String user){
        _bictovUser = BictovUser.fromJson(user);
        notifyListeners();
    }

    String province = 'من فضلك قم باختيار محافظتك';

    String city_village = 'من فضلك قم باختيار مدينتك / قريتك';

    void setProvince(String val){
        province = val;
        notifyListeners();
    }

    void setCityOrVillage(String val){
        city_village = val;
        notifyListeners();
    }
}
