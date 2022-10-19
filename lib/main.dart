import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Login_Screen/Login_Cubit/cubit.dart';
import 'package:shop_app/Login_Screen/Login_Screen.dart';
import 'package:shop_app/Network/Remote/dioHelper.dart';
import 'ON Boarding/onBoardingScreen.dart';
import 'Style/Colors.dart';
void main() {
  DioHelper.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>ShopLoginCubit()),
      ],
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme:AppBarTheme(color: defultcolor),
          floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: defultcolor,),
        primarySwatch: Colors.brown,
        ),
        home: onBoardingScreen(),
      ),
    );
  }
}
