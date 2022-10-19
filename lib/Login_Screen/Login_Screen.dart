import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Components/Components.dart';
import 'package:shop_app/Login_Screen/Login_Cubit/cubit.dart';
import 'package:shop_app/Login_Screen/Login_Cubit/states.dart';
import 'package:shop_app/Register_Screen/RegisterScreen.dart';
import 'package:shop_app/Style/Colors.dart';

class LoginScreen extends StatelessWidget {
  var mailController=TextEditingController();
  var passController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLoginCubit,ShopLoginStates>(
      builder: (BuildContext context, state) =>Scaffold(
        appBar: AppBar(),
        body:Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text('LOGIN',style: TextStyle(fontSize: 34,fontWeight: FontWeight.w500),),
                  SizedBox(height: 15,),
                  Text('login now to browse our hot offers',style: TextStyle(fontSize: 15,color:defultcolor ),),
                  SizedBox(height: 20,),
                  defultTextForm(
                      controller: mailController,
                      validate:(String? value){
                        if(value!.isEmpty){
                          return'The Mail Can\'t Empty';
                        }} ,
                      label: 'E_mail Address',
                      prefixIcon:Icon(Icons.mail_outline_outlined),
                      keyboardType: TextInputType.emailAddress),
                  SizedBox(
                    height: 20,
                  ),
                  defultTextForm(
                      controller: passController,
                      validate:(String? value){
                        if(value!.isEmpty){
                          return'The password Can\'t Empty';
                        }} ,
                      label: 'Password',
                      prefixIcon:Icon(Icons.lock),
                      sufixIcon: Icon(Icons.visibility_outlined),
                      keyboardType:TextInputType.visiblePassword),
                  SizedBox(height: 20,),
                  defultButton(label: 'LOGIN', onPressed: (){}),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Dont\' have an account'),
                      TextButton(onPressed: (){
                        Navigator.push((context),
                            MaterialPageRoute(builder:(context)=>RegisterScreen())); }, child:Text('REGISTER'))
                    ],)
                ],
              ),
            ),
          ),
        ) ,
      ),
      listener: (BuildContext context, state){},

    );
  }
}
