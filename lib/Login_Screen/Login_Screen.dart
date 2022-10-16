import 'package:flutter/material.dart';
import 'package:shop_app/Style/Colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Column(
        children: [
          Text('LOGIN',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
          Text('login now to browse our hot offers',style: TextStyle(fontSize: 10,color:defultcolor ),),

        ],
      ) ,
    );
  }
}
