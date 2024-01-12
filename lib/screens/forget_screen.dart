// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:chatting/bloc/auth_states.dart';
import 'package:chatting/screens/sign_in.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../assets/app_assets.dart';
import '../bloc/auth_cubit.dart';
import '../classes/app_colors.dart';
import '../classes/app_text_styles.dart';
import '../classes/navigation.dart';
import '../constants/components.dart';
class ForgetScreen extends StatelessWidget {
  ForgetScreen({super.key});
  TextEditingController emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(BuildContext context)=>AuthCubit(),
      child:BlocConsumer<AuthCubit,AuthStates>(builder:(context,state)
      {
        return Scaffold(
          body:SafeArea(child:Form(
              key:formKey,
              child:SingleChildScrollView(
                physics:BouncingScrollPhysics(),
                child:Column(
                  children:
                  [
                    SizedBox(height:108,),
                    Align(
                      alignment:Alignment.center,
                      child:Text('Forgot Password',style:CustomTextStyles.poppins500style24.copyWith(fontWeight:FontWeight.w600,color:AppColors.deepBrown),),
                    ),
                    SizedBox(height:40.0,),
                    Container(
                      width:235,
                      height:235,
                      decoration:BoxDecoration(
                        image:DecorationImage(image:AssetImage(AppAssets.forgetPassword)),
                      ),
                    ),
                    SizedBox(height:24.0,),
                    Padding(padding:EdgeInsets.symmetric(horizontal:34),child:Text('Enter your registered email below to receive password reset instruction',textAlign:TextAlign.center,style:CustomTextStyles.poppins500style24.copyWith(
                      fontSize:14,
                      height:1.5,
                      fontWeight:FontWeight.w400,
                      color:AppColors.deepGrey,
                    ),),),
                    SizedBox(height:41,),
                    Padding(padding:EdgeInsets.symmetric(horizontal:24),child: customTextFormField(labelText:'EmailAddress',controller:emailController,textType:TextInputType.emailAddress,validator:(value)
                    {
                      if(value!.isEmpty)
                      {
                        return 'This Field Must Not Be Empty';
                      }
                      return null;
                    }),),
                    SizedBox(height:129,),
                    Padding(padding:EdgeInsets.symmetric(horizontal:16),child:ConditionalBuilder(condition:state is !LoadingForgetPasswordState,
                        builder:(context)=>customButton(width:343,height:56,onPressed:()
                        async {
                          if(formKey.currentState!.validate())
                          {
                            await AuthCubit.get(context).resetPasswordWithLink(email:emailController.text);
                          }
                        },color:AppColors.primaryColor,borderRadius:BorderRadius.circular(8.0),textButton:'Send Reset Password Link',textStyle:CustomTextStyles.poppins500style24.copyWith(
                          fontSize:18,
                          color:Color(0xffFFFFFF),
                        )),
                        fallback:(context)=>Center(child:CircularProgressIndicator(color:AppColors.primaryColor,),)),),
                    SizedBox(height:17,),
                  ],
                ),
              ))),
        );
      }, listener:(context,state)
      {
        if(state is SuccessForgetPasswordState)
        {
          Fluttertoast.showToast
            (
            msg:'Check Your Email To Reset Your Password',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          customNavigate(context,SignInScreen());
        }
        else if (state is ErrorForgetPasswordState)
        {
          Fluttertoast.showToast
            (
            msg:state.error,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      }),
    );
  }
}