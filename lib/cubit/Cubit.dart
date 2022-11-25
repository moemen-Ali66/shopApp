import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/States.dart';
import '../CategoriesScreen/CategoriesScreen.dart';
import '../FavouriteScreen/FavouriteScreen.dart';
import '../ProductsScreen/ProductsScreen.dart';
import '../SettingsScreen/SettingsScreen.dart';
class ShopCubit extends Cubit<ShopStates>
{
  ShopCubit() : super(ShopIntialStates());
  static ShopCubit get(context) =>BlocProvider.of(context);
  int Curentindex=0;
  List<Widget>Screens=[
    ProductScreen(),
    CategoriesScreen(),
    FavouriteScreen(),
    SettingScreen(),
  ];
void changeScreen(int index){
  Curentindex=index;
  emit(ChangeBottomNav());
}


}