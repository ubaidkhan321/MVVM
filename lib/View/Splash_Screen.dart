import 'package:flutter/material.dart';
import 'package:handel_exception/View_Model/Services/splash_Services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashService splashService = SplashService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashService.checkauthentication(context);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Splash"),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}