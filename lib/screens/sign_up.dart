// ignore_for_file: prefer_const_constructors
import 'package:chatting/classes/app_colors.dart';
import 'package:chatting/screens/sign_up_view.dart';
import 'package:flutter/material.dart';
import '../classes/app_text_styles.dart';
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
      body:Padding(padding:EdgeInsets.only(bottom:17),child:SingleChildScrollView(
          physics:BouncingScrollPhysics(),
          child:Column(
            children:
            [
              Padding(padding:EdgeInsets.only(top:90),child: Center(child:Text('Welcome !',style:CustomTextStyles.poppins500style24.copyWith(fontSize:28,fontWeight:FontWeight.w600,color:AppColors.deepBrown),)),),
              SizedBox(height:30.0,),
              signUpView(),
            ],
          )),
      ),),
    );
  }
}