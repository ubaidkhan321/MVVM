


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:handel_exception/Model/UserModel.dart';
import 'package:handel_exception/Repository/_auth_repository.dart';
import 'package:handel_exception/Utitlites/Routes/Routes_name.dart';
import 'package:handel_exception/Utitlites/utitlies.dart';
import 'package:handel_exception/View/userViewModel.dart';
import 'package:provider/provider.dart';


class AuthViewModel with ChangeNotifier{

  final _myrespone = AuthRepository();
   bool _loading = false;
  bool get loading => _loading;

  setloading(bool value){
    _loading =value;
     notifyListeners();
  }

   bool _signuploading = false;
   bool  get signload => _signuploading;

    setsignup(bool value){
    _signuploading =value;
     notifyListeners();
  }
//Login APIs...................................................
  Future <void> isloginApi(dynamic data,BuildContext context)async{
    setloading(true);
    _myrespone.loginApi(data).then((value) {
      setloading(false);
      final userpreference = Provider.of<UserViewModel>(context,listen: false);
      userpreference.SaveUser(
        UserModel(
          token: value['token'].toString()
        )
      );
      Utils().toastMessage("Login Successfully");
      Navigator.pushNamed(context, RouteName.home);
      if(kDebugMode){
        print(value.toString());
      }

    }).onError((error, stackTrace) {
      setloading(false);
      if(kDebugMode){
        Utils().toastMessage(error.toString());
        print(error.toString());
      }

    });

  }
  //Register API..................................................................
  Future <void> issignup(dynamic data,BuildContext context)async{
     setsignup(true);
    
    //myrespone ko hmny auth Repostoriy sy initilize kara hai to wo hmmy apny "loginApi" pai le kar ja rha hai 
    _myrespone.loginApi(data).then((value) {

      setsignup(false);

      Utils().toastMessage("SignUp Successfully");
      Navigator.pushNamed(context, RouteName.login);
      if(kDebugMode){
        print(value.toString());
      }

    }).onError((error, stackTrace) {

      setsignup(false);

      if(kDebugMode){
        Utils().toastMessage(error.toString());
        print(error.toString());
      }

    });

  }
}