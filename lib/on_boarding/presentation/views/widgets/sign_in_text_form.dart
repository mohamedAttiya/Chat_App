import 'package:flutter/material.dart';
import '../../../../bloc/auth_cubit.dart';
import '../../../../constants/components.dart';
import '../../../../screens/sign_up_view.dart';
Widget signInTextForm(context)=>Column(
  children:
  [
    Padding(padding:EdgeInsets.symmetric(horizontal:24.0),child:customTextFormField(labelText:'Email Address',
        isPassword:false,
        textType:TextInputType.emailAddress ,controller:emailController,validator:(value)
        {
          if(value!.isEmpty)
          {
            return 'This Field Must Not Be Empty!';
          }
          return null;
        }),),
    SizedBox(height:25.0,),
    Padding(padding:EdgeInsets.symmetric(horizontal:24.0),child: customTextFormField(labelText:'Password',
        isPassword:AuthCubit.get(context).isPassword,
        suffix:AuthCubit.get(context).suffix,
        suffixOnPressed:()
        {
          AuthCubit.get(context).changeVisibility();
        },
        textType:TextInputType.visiblePassword ,controller:passwordController,validator:(value)
        {
          if(value!.isEmpty)
          {
            return 'This Field Must Not Be Empty!';
          }
          return null;
        }),),
  ],
);