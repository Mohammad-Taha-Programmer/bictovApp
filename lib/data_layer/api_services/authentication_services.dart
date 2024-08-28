import 'dart:convert';
import 'package:bictov/declarations/constants.dart';
import 'package:bictov/declarations/functions/functions.dart';
import 'package:bictov/presentation_layer/home_screen.dart';
import 'package:bictov/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class Authentication {

  // Old version
  /*
  Future<void> authenticateUser({required BuildContext context, required String phone, required String password}) async {
    //Sends a request to the server to authenticate the client:
    try
    {
      http.Response response = await http.post(
        Uri.parse('$appUri/api/auth'),
        body: jsonEncode({'phone': phone, 'password': password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=utf-8'
        },
      );

      processResponseStatusCodes(
        context: context,
        response: response,
        goAhead: () async {
            SharedPreferences bictovPrefs = await SharedPreferences.getInstance();

            UserModelProvider userModelProvider = Provider.of<UserModelProvider>(context, listen: false);

            userModelProvider.setBictovUserData(response.body);

            await bictovPrefs.setString('x-bictov-authentication-token', jsonDecode(response.body)['token']);

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('أهلاً وسهلاً بك، ${userModelProvider.bictovUser.name}')));

            if(userModelProvider.bictovUser.type == 'Normal-user') {
              SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
              await sharedPreferences.setString('browsingMode', 'Normal-user');
              Navigator.pushNamedAndRemoveUntil(context, NormalUserLayout.widgetName, (Route<dynamic> route) => false);
            }

            else if (userModelProvider.bictovUser.type == 'Business') {
              SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
              await sharedPreferences.setString('browsingMode', 'Business');
              Navigator.pushNamedAndRemoveUntil(context, BusinessLayout.widgetName, (Route<dynamic> route)  => false);
            }

          }
      );
    } catch (error)
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
    }
  }
*/

  // current version
  Future<bool> authenticateUser({required BuildContext context, required String phone}) async {
    bool authOk = false;
    //Sends a request to the server to authenticate the client:
    try
    {
      http.Response response = await http.post(
        Uri.parse('$appUri/api/auth'),
        body: jsonEncode({'phone': phone}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=utf-8'
        },
      );

      authOk = processResponseStatusCodes(
          context: context,
          response: response,
          goAhead: () async {
            SharedPreferences bictovPrefs = await SharedPreferences.getInstance();

            UserModelProvider userModelProvider = Provider.of<UserModelProvider>(context, listen: false);

            userModelProvider.setBictovUserData(response.body);

            await bictovPrefs.setString('x-bictov-authentication-token', jsonDecode(response.body)['token']);

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('أهلاً وسهلاً بعودتك، ${userModelProvider.bictovUser.name}')));
            Navigator.pushReplacementNamed(context, Home.widgetName);
          }
      );

    } catch (error)
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
    }
    return authOk;
  }

  Future<void> bringCurrentUserData(BuildContext context) async {
    /*
      Sends a request to the server twice to accomplish two objectives:
        1 - Check if the token sent to the server is actually a valid one
        2 - receive the data concerning the user of which the token is
        3 - Fill the data received in a model created for that purpose
     */
    try
      {
        // get the token saved on the mobile using shared preferences package to send it to the server
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        String? token = await sharedPreferences.getString('x-bictov-authentication-token');

        http.Response tokenResponse = await http.post(
            Uri.parse('$appUri/api/auth/token_validation'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=utf-8',
              'x-bictov-authentication-token': token!,
            }
        );
        bool tokenResponseBody = jsonDecode(tokenResponse.body);
        if(tokenResponseBody){
          http.Response currentUserDataResponse = await http.get(
            Uri.parse('$appUri/api/auth'),
            headers: <String, String>{
              'Content-Type' : 'application/json charset=utf-8',
              'x-bictov-authentication-token' : token
            },
          );
          UserModelProvider userModelProvider = Provider.of<UserModelProvider>(context, listen: false);
          userModelProvider.setBictovUserData(currentUserDataResponse.body);
        }

      } catch (error) {
        print('Error from authentication_services.dart file bringCurrentUserData method: ${error.toString()}');
      }
  }

}
