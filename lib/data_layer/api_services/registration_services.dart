import 'dart:convert';
import 'package:bictov/data_layer/models/user_model.dart';
import 'package:bictov/declarations/constants.dart';
import 'package:bictov/declarations/functions/functions.dart';
import 'package:bictov/presentation_layer/screens/registration_and_authentication/user/authenticate_users_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Registration {
  void registerUser({
    required String name,
    required String phone,
    required String password,
    required String gender,
    required BuildContext context,
  }) async {
    try {
      BictovUser user = BictovUser.fullUserData(name: name, phone: phone, password: password, gender: gender);
      http.Response response = await http.post(
        Uri.parse('$appUri/api/signUp'),
       // body: user.toJson(),
        body: jsonEncode({
          "name": user.name,
          "phone" : user.phone,
          "password": user.password,
          "gender" : user.gender,
          "email" : "hmode_hussain@gmail.com"
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=utf-8'
        },
      );

      processResponseStatusCodes(
        context: context,
        response: response,
        goAhead: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('تم انشاء حسابك بنجاح!')));
          Navigator.pushNamed(context, AuthenticateUsersScreen.widgetName);
        },
      );
    } catch (error) {
      print('Error From registration file registerUser method catch statement: ${error.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Error From registration file registerUser method catch statement: ${error.toString()}')));
      print(error.toString());
    }
  }

  Future<void> registerBusiness({
    required String name, //
    required String phone, //
    required String password, //
    required String email, //
    required String businessName, //
    required String businessDescription, //
    required List<String> salesTypes, //
    required String businessLogo, //
    required String id, //
    required BuildContext context,
  }) async {
    try {
      BictovUser user = BictovUser(
          name: name,
          phone: phone,
          password: password,
          email: email,
          businessName: businessName,
          businessDescription: businessDescription,
          gender: '',
          salesTypes: salesTypes,
          businessLogo: businessLogo,
          userId: id);
      http.Response response = await http.post(
        Uri.parse('$appUri/api/signUp/business'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=utf-8'
        },
      );

      processResponseStatusCodes(
        context: context,
        response: response,
        goAhead: () {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('تم انشاء حساب الأعمال بنجاح!')));
          Navigator.pushNamed(context, AuthenticateUsersScreen.widgetName);
        },
      );
    } catch (error) {
      print(
          'Error From registration file registerBusiness method catch statement: ${error.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error From registration file registerBusiness method catch statement: ${error.toString()}')));
    }
  }

  Future<bool> verifyUserExists({required BuildContext context, required String phone}) async {
    bool userExists = false;
    http.Response response = await http.post(
      Uri.parse('$appUri/api/signUp/verifyUserExists'),
      body: jsonEncode({'phone' : phone}),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8'
      },
    );

    var res = jsonDecode(response.body);
    print(res);

    return userExists;
  }

}
