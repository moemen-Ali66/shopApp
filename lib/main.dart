import 'package:flutter/material.dart';
import 'package:shop_app/Login_Screen/Login_Screen.dart';

import 'ON Boarding/onBoardingScreen.dart';
import 'Style/Colors.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme:AppBarTheme(color: defultcolor),
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: defultcolor,),
      primarySwatch: Colors.brown,
      ),
      home: LoginScreen(),
    );
  }
}
