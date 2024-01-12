// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:chatting/bloc/auth_states.dart';
import 'package:chatting/classes/app_text_styles.dart';
import 'package:chatting/screens/sign_up.dart';
import 'package:chatting/screens/sign_up_view.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../bloc/auth_cubit.dart';
import '../classes/app_colors.dart';
import '../classes/navigation.dart';
import '../constants/components.dart';
import '../on_boarding/presentation/views/widgets/sign_in_text_form.dart';
import 'forget_screen.dart';
class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  var formKey = GlobalKey<FormState>();
  String? emailAddress;
  String? password;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(BuildContext context)=>AuthCubit(),
      child:BlocConsumer<AuthCubit,AuthStates>(builder:(context,state)
      {
        return Scaffold(
          appBar:AppBar(
            elevation:0.0,
          ),
          body:Padding(padding:EdgeInsets.only(bottom:17.0),child:SingleChildScrollView(
            physics:BouncingScrollPhysics(),
            child:Form(
                key:formKey,
                child:Column(
                  children:
                  [
                    SizedBox(height:32,),
                    Text('Welcome Back !',style:CustomTextStyles.poppins500style24.copyWith(color:AppColors.deepBrown,fontWeight:FontWeight.w600),),
                    SizedBox(height:48,),
                    signInTextForm(context),
                    SizedBox(height:16,),
                    Align(alignment:Alignment.centerRight,child:Padding(padding:EdgeInsets.only(right:15),child:TextButton(onPressed:()
                    {
                      customNavigate(context,ForgetScreen());
                    },child:Text('Forgot Password ?',style:CustomTextStyles.poppins500style24.copyWith(
                      color:AppColors.deepBrown,
                      fontSize:12,
                      fontWeight:FontWeight.w600,
                    ),)),),),
                    SizedBox(height:102,),
                    ConditionalBuilder(condition:state is! LoadingCreateUserWithEmailAndPassword,
                        builder:(context)=>Padding(padding:EdgeInsets.symmetric(horizontal:24.0),child:customButton(width:343,height:56,color:AppColors.primaryColor,borderRadius:BorderRadius.circular(8.0),textButton:'Sign In',
                            textStyle:CustomTextStyles.poppins500style24.copyWith(fontSize:18,color:AppColors.offWhite),onPressed:()
                            async {

                              if(formKey.currentState!.validate())
                              {
                                await AuthCubit.get(context).signInWithEmailAndPassword(emailAddress:emailController.text,password:passwordController.text);
                              }
                            }),), fallback:(context)=>Center(child:CircularProgressIndicator(
                          color:AppColors.primaryColor,
                        ),)),
                    SizedBox(height:16.0,),
                    buttonAndText(text:'Don’t have an account ?', buttonText:'Sign Up',onPressed:()
                    {
                      customReplacementNavigate(context,SignUpScreen());
                    }),
                  ],
                )),
          ),),
        );
      }, listener:(context,state)
      {
        if (state is ErrorCreateUserWithEmailAndPassword)
        {
          Fluttertoast.showToast
            (
            msg:state.error.toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
        if(state is SuccessCreateUserWithEmailAndPassword)
        {
          FirebaseAuth.instance.currentUser!.emailVerified?Navigator.pushNamed(context,'chatPage',arguments:AuthCubit.get(context).signInWithEmailAndPassword(emailAddress:emailAddress!,password:password!)):Fluttertoast.showToast
            (
            msg:'Please Verify Your E-mail',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      }),
    );
  }
}