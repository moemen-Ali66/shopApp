import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Network/Remote/dioHelper.dart';
import 'package:shop_app/Network/constant.dart';
import 'package:shop_app/Network/end_points.dart';
import 'package:shop_app/cubit/States.dart';
import 'package:shop_app/models/HomeModel.dart';
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
HomeModel ?homeModel;
void getHomeData(){
  emit(ShopLoadingHomeState());
  DioHelper.getData(
    url: HOME,
    token: token,
  ).then((value) {
    homeModel=HomeModel.fromJson(value.data);
    emit(ShopSuccessHomeState());
  }).catchError((error){
    print(error.toString());
    emit(ShopErrorHomeState(error));
  });
}

}