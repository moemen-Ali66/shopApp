import 'package:flutter/material.dart';
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  buildCAT();
  }
  Widget buildCAT()=>  Padding(padding: EdgeInsets.all(20),
    child:  Row(
      children: [
        CircleAvatar(backgroundImage:AssetImage('images/onBoard_1.jpg'),radius: 20,),
        SizedBox(width: 30.0,),
        Text('Phone',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
        Spacer(),
        Icon(Icons.arrow_forward_ios_outlined),

      ],
    ),);
}
