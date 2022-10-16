import 'package:flutter/material.dart';
import 'package:shop_app/Login_Screen/Login_Screen.dart';

import 'ON Boarding/onBoardingScreen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme:AppBarTheme(color: Colors.black12),
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.black12,)
      ),
      home: LoginScreen(),
    );
  }
}
