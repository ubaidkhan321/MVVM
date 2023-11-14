import 'package:flutter/material.dart';
import 'package:handel_exception/Model/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier{

  Future<bool> SaveUser(UserModel user)async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    notifyListeners();
    return true;
  }
  Future<UserModel> getUser()async{

    SharedPreferences sp = await SharedPreferences.getInstance();
    final String? gettoken = sp.getString('token');

    return UserModel(
      token: gettoken.toString()
    );
  }
  Future<bool> notlogin()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
     return true;
  }
}