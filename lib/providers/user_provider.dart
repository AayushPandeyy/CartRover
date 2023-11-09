import 'package:cart_rover/models/User.dart';
import 'package:flutter/material.dart';


class UserProvider extends ChangeNotifier{
  User _user = User(
    address: '', 
    id: '',
    name: '', 
    email: '', 
    password: '', 
    type: '', 
    token: ''
  );

  User get user => _user;

  void setUser(String user){
    _user = User.fromJson(user);
    notifyListeners();
  }
  

}