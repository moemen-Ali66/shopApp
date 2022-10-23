import 'package:flutter/material.dart';
import 'package:shop_app/Style/Colors.dart';
///////////////////////////////defultTextForm//////////////////////////
Widget defultTextForm(
{
   validate ,
   onChanged,
   onTab,
   sufixIcon,
  hintText,
  sufixPressed,
  required TextEditingController controller,
  required String label,
  required Icon prefixIcon,
  required var keyboardType,
 bool ispassword=false,
}
    )=>TextFormField(

  validator: validate,
  onTap:onTab ,
  onChanged: onChanged,
  keyboardType:keyboardType ,
  obscureText:ispassword ,
  decoration: InputDecoration(
    suffixIcon: sufixIcon,
    prefixIcon: prefixIcon,
    label: Text(label),
    labelStyle:const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w400),
    hintText: hintText,
    hintStyle: TextStyle(backgroundColor: Colors.white10),
    border: OutlineInputBorder(),

  ),
);
//////////////////////////////////defultButton/////////////////////////////////////////////
Widget defultButton({
  required label,
  required onPressed,
})=> Container(
    color: defultcolor,
    height: 50,
    width: double.infinity,
    child:
    TextButton(onPressed: onPressed,
      child: Text(label,style: TextStyle(color:Colors.white,fontSize: 20),),));