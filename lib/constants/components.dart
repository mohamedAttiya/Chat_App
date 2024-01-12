// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '../classes/app_text_styles.dart';
Widget buttonAndText({
  context,
  required String text,
  required String buttonText,
  required Function()? onPressed,
})=>Column(
  children:
  [
    Row(
      mainAxisAlignment:MainAxisAlignment.center,
      children:
      [
        Text(text,style:CustomTextStyles.poppins500style24.copyWith(fontSize:12,fontWeight:FontWeight.w400,color:Color(0xffB4B4B4)),),
        TextButton(onPressed:onPressed,child: Text(buttonText,style:CustomTextStyles.poppins500style24.copyWith(fontSize:12,fontWeight:FontWeight.w400,color:Color(0xffB4B4B4)),),)
      ],
    )
  ],
);
Widget customTextFormField({
  Icon? suffix,
  required String labelText,
  Function()? suffixOnPressed,
  required TextInputType textType,
  required TextEditingController controller,
  required String? Function(String?)? validator,
  bool isPassword = true,
})=>TextFormField(
  keyboardType:textType,
  cursorColor:Colors.grey,
  obscureText:isPassword,
  controller:controller,
  validator:validator,
  decoration:InputDecoration(
      labelText:labelText,
      labelStyle:CustomTextStyles.poppins500style24.copyWith(fontSize:16,color:Colors.grey),
      suffixIcon:suffix!=null ? IconButton(onPressed:suffixOnPressed,icon:suffix,color:Colors.grey,) : null,
      enabledBorder:OutlineInputBorder(
        borderSide:BorderSide(color:Colors.grey),
        borderRadius:BorderRadius.circular(4.0),
      ),
      focusedBorder:OutlineInputBorder(
        borderSide:BorderSide(color:Colors.grey),
        borderRadius:BorderRadius.circular(4.0),
      )
  ),
);
Widget customButton(
    {
      required double width,
      required double height,
      required Color color,
      required BorderRadius borderRadius,
      required String textButton,
      required TextStyle textStyle,
      Function()? onPressed,
    })=>Container(
  width:width,
  height:height,
  decoration:BoxDecoration(
      color:color,
      borderRadius:borderRadius
  ),
  child:MaterialButton(onPressed:onPressed,child:Text(textButton,style:textStyle),),
);