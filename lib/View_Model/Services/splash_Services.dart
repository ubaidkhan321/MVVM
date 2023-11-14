import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:handel_exception/Model/UserModel.dart';
import 'package:handel_exception/Utitlites/Routes/Routes_name.dart';
import 'package:handel_exception/View/userViewModel.dart';

class SplashService{
   Future <UserModel> getusermodel()=> UserViewModel().getUser();
   void checkauthentication(BuildContext context)async{

    getusermodel().then((value) {
      if(kDebugMode){
        print(value.token.toString());
      }
      if(value.token.toString()  == 'null'|| value.token.toString() == ""){
         Future.delayed(Duration(seconds: 3));
            Navigator.pushNamed(context, RouteName.login);
      }
      else{
        Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RouteName.home);
      }

    }).onError((error, stackTrace) {
      if(kDebugMode){
        print(error.toString());
      }

    });
   }
}