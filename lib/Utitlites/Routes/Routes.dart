 

import 'package:flutter/material.dart';
import 'package:handel_exception/Utitlites/Routes/Routes_name.dart';
import 'package:handel_exception/View/HomeScreen.dart';
import 'package:handel_exception/View/LoginScreen.dart';
import 'package:handel_exception/View/Splash_Screen.dart';
import 'package:handel_exception/View/signup.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
switch(settings.name){

  case RouteName.home:
  return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());
  case RouteName.splash:
  return MaterialPageRoute(builder: (BuildContext context) => const SplashScreen());
  case RouteName.login:
  return MaterialPageRoute(builder: (BuildContext context) => const LoginScreen());
  case RouteName.signup:
  return MaterialPageRoute(builder: (BuildContext context) => const SignUpviewScreen());
  default:
  return MaterialPageRoute(builder: (_){
    return const Scaffold(
      body: Center(
        child: Text("No_Route_Define"),
      ),
    );

  });
}

  }

 }