import 'package:flutter/material.dart';
import 'package:shop_app/Style/Colors.dart';

class LoginScreen extends StatelessWidget {
var mailController=TextEditingController();
var passController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text('LOGIN',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
                SizedBox(height: 15,),
                Text('login now to browse our hot offers',style: TextStyle(fontSize: 15,color:defultcolor ),),
                SizedBox(height: 20,),
                TextFormField(
                  controller: mailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration:InputDecoration(
                    labelText: 'E_mail Address',
                    border: OutlineInputBorder(),
                      prefixIcon:Icon(Icons.mail_outline_outlined)
                  ) ,
                  validator: (String? value){
                    if(value!.isEmpty){
                      return'The Mail Can\'t Empty';
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration:InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon:Icon(Icons.lock),
                      suffixIcon:Icon(Icons.visibility_outlined),
                  ) ,
                  validator: (String? value){
                    if(value!.isEmpty){
                      return'The password Can\'t Empty';
                    }
                  },
                ),
                SizedBox(height: 20,),
                Container(
                  color: defultcolor,
                  height: 50,
                    width: double.infinity,
                    child:
                    TextButton(onPressed: (){},
                      child: Text('LOGIN',style: TextStyle(color:Colors.white,fontSize: 20),),)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text('Dont\' have an account'),
                  TextButton(onPressed: (){}, child:Text('REGISTER'))
                ],)
              ],

            ),
          ),
        ),
      ) ,
    );
  }
}
