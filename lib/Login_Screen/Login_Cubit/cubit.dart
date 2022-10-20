import 'package:shop_app/Login_Screen/Login_Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Network/Remote/dioHelper.dart';
import 'package:shop_app/Network/end_points.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>{
  // ShopLoginCubit(super.ShopLoginInitialStates);


  ShopLoginCubit():super(ShopLoginInitialStates());

  static ShopLoginCubit get(context)=>BlocProvider.of(context);

  void userLogin({
    required email,
    required password,
  }){
    emit(ShopLoginLoadingStates());
    DioHelper.postData(url:LOGIN, data: {
      email:email,
      password:password,
    }).then((value){
      emit(ShopLoginSuccessStates());
    }).catchError((Error){
      emit(ShopLoginErrorStates(Error.toString()));
    });
  }
  bool showpassword=true;
   void changeSufix(){
    showpassword=!showpassword;
    emit(ChangePasswordStates());
  }
}
