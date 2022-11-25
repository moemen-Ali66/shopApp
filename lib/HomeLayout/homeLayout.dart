import 'package:flutter/material.dart';
import 'package:shop_app/Login_Screen/Login_Screen.dart';
import 'package:shop_app/Network/Local/Cache_helper.dart';
import 'package:shop_app/cubit/Cubit.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cubit=ShopCubit.get(context);
    return Scaffold(
    appBar: AppBar(actions: [
        TextButton(onPressed: (){

        },
            child: Text('SIGNOUT'))
      ],),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.apps),label: 'Categories'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorite'),
        BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
      ],
      currentIndex: cubit.Curentindex,
      onTap: (index){
        cubit.changeScreen(index);
      },),
    );
  }
}
