import 'dart:convert';

import 'package:cart_rover/common/widgets/bottom_bar.dart';
import 'package:cart_rover/constants/error_handling.dart';
import 'package:cart_rover/constants/global_variables.dart';
import 'package:cart_rover/constants/utils.dart';
import 'package:cart_rover/features/home/screens/home_screen.dart';
import 'package:cart_rover/models/User.dart';
import 'package:cart_rover/providers/user_provider.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService{
  //sign up user
  void signUpUser({required BuildContext context ,required String email , required String password , required String name})
  async{
      try{
          User user = User(
            id: '' , 
            email: email,
            name: name ,
            password: password,
            address: '',
            type: '',
            token: ''
            );

            http.Response response = await http.post(
              Uri.parse("${uri}/api/signup") , 
              body: user.toJson(),
              headers: <String , String>{
                'Content-type': 'application/json; charset=utf-8',
              }
              );
                httpErrorHandle(response: response, context: context, onSuccess: (){
                  showSnackBar(context, "Account created!");
                });
      }catch(e){
        showSnackBar(context, e.toString());
      }
  }
  void signInUser({required BuildContext context ,required String email , required String password }) async{
    try{

            http.Response response = await http.post(
              Uri.parse("${uri}/api/signin") , 
              body: jsonEncode({
                'email':email,
                'password':password
              }),
              headers: <String , String>{
                'Content-type': 'application/json; charset=utf-8',
              }
              );
                httpErrorHandle(response: response, context: context, onSuccess: () async{
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  showSnackBar(context, "Login Success");
                  Provider.of<UserProvider>(context,listen: false).setUser(response.body);
                  await prefs.setString('x-auth-token', jsonDecode(response.body)['token']);
                  Navigator.pushNamed(context, BottomBar.routeName);
                });
      }catch(e){
        showSnackBar(context, e.toString());
      }
  }

  void getUserData(BuildContext context  ) async{
    try{
              SharedPreferences prefs = await SharedPreferences.getInstance();
              String? token = prefs.getString('x-auth-token');

              if(token == null){
                prefs.setString('x-auth-token', '');
              }

              var tokenRes = await http.post(
                Uri.parse('$uri/tokenIsValid'),
                headers: <String , String> {
                  'content-type': 'application/json; charset = UTF-8',
                  'x-auth-token' : token!
                },
              );

              var response = jsonDecode(tokenRes.body);

              if(response == true ){
                http.Response userResponse = await http.get(Uri.parse('$uri/'),
                headers: <String , String> {
                  'content-type': 'application/json; charset = UTF-8',
                  'x-auth-token' : token
                },
                );

                    var userProvider = Provider.of<UserProvider>(context,listen: false);
                    userProvider.setUser(userResponse.body);
                
              }

      }catch(e){
        showSnackBar(context, e.toString());
      }
  }


}