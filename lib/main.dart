import 'package:flutter/material.dart';
import 'package:handel_exception/Utitlites/Routes/Routes.dart';
import 'package:handel_exception/Utitlites/Routes/Routes_name.dart';
import 'package:handel_exception/View/auth_view_model.dart';
import 'package:handel_exception/View/userViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> AuthViewModel()),
        ChangeNotifierProvider(create: (_)=> UserViewModel()),

      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RouteName.splash,
      onGenerateRoute: Routes.generateRoute,
    ),
      );
  }
}

