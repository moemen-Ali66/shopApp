import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Login_Screen/Login_Screen.dart';
import 'package:shop_app/Network/Local/Cache_helper.dart';
import 'package:shop_app/SearchScreen/SearchScreen.dart';
import 'package:shop_app/cubit/Cubit.dart';
import 'package:shop_app/cubit/States.dart';
class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cubit=ShopCubit.get(context);
    return BlocConsumer<ShopCubit,ShopStates>(
        builder: (context,state){return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen(),));
          }, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.brightness_4_outlined)),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:Colors.brown,
          unselectedItemColor:Colors.grey,
          selectedItemColor:Colors.brown,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.apps),label: 'Categories'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorite'),
        BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
      ],
        currentIndex: cubit.Curentindex,
        onTap: (index){
          cubit.changeScreen(index);
        },),
      body: cubit.Screens[cubit.Curentindex],
    );},
        listener: (context,state){});
  }
}
