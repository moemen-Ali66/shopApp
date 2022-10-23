import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Components/Components.dart';
import 'package:shop_app/Login_Screen/Login_Cubit/cubit.dart';
import 'package:shop_app/Login_Screen/Login_Cubit/states.dart';
import 'package:shop_app/Register_Screen/RegisterScreen.dart';
import 'package:shop_app/Style/Colors.dart';

class LoginScreen extends StatelessWidget {

 var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var mailController=TextEditingController();
    var passController=TextEditingController();
    return BlocConsumer<ShopLoginCubit,ShopLoginStates>(
      builder: (BuildContext context, state) =>Scaffold(
        appBar: AppBar(),
        body:Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Form(
                key: formkey,
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
                      // sufixPressed: (){
                      // ShopLoginCubit.get(context).changeSufix;
                      // },
                        controller: passController,
                        validate:(String? value){
                          if(value!.isEmpty){
                            return'The password Can\'t Empty';
                          }} ,
                        ispassword: ShopLoginCubit.get(context).showpassword,
                        label: 'Password',
                        prefixIcon:Icon(Icons.lock),
                        sufixIcon:IconButton(onPressed: (){
                          ShopLoginCubit.get(context).changeSufix();
                        }, icon:ShopLoginCubit.get(context).showpassword ? Icon(Icons.visibility_outlined):
                        Icon(Icons.visibility_off_outlined),),
                        keyboardType:TextInputType.visiblePassword),
                    SizedBox(height: 20,),
                    ConditionalBuilder(
                        condition: state is! ShopLoginLoadingStates,
                        builder:(context) =>defultButton(label: 'LOGIN', onPressed: (){
                          if(formkey.currentState!.validate()){
                            ShopLoginCubit.get(context).userLogin(
                                email:mailController.text ,
                                password:passController.text );
                          }

                        }),
                        fallback:(context) =>Center(child: CircularProgressIndicator())),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Dont\' have an account'),
                        TextButton(onPressed: (){
                          Navigator.push((context),
                              MaterialPageRoute(builder:(context)=>RegisterScreen())); },
                            child:Text('REGISTER'))
                      ],)
                  ],
                ),
              ),
            ),
          ),
        ) ,
      ),
      listener: (BuildContext context, state){
        if(state is ShopLoginSuccessStates){
          if(state.loginModel){}
        }
      },

    );
  }
}
