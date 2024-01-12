import 'package:chatting/bloc/auth_cubit.dart';
import 'package:chatting/bloc/auth_states.dart';
import 'package:chatting/on_boarding/presentation/views/widgets/terms_and_condition.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../classes/app_colors.dart';
import '../../../classes/app_text_styles.dart';
import '../../../classes/navigation.dart';
import '../../../constants/components.dart';
import '../../../screens/sign_in.dart';
var firstNameController = TextEditingController();
var lastNameController = TextEditingController();
var emailController = TextEditingController();
var passwordController = TextEditingController();
var formKey = GlobalKey<FormState>();
Widget signUpView()=>BlocProvider(create:(BuildContext context)=>AuthCubit(),
  child:BlocConsumer<AuthCubit,AuthStates>(builder:(context,state)
  {
    return Form(
        key:formKey,
        child:Column(
          children:
          [
            Padding(padding:EdgeInsets.symmetric(horizontal:24.0),child:customTextFormField(labelText:'First Name',
                isPassword:false,
                textType:TextInputType.name ,controller:firstNameController,validator:(value)
                {
                  if(value!.isEmpty)
                  {
                    return 'This Field Must Not Be Empty!';
                  }
                  return null;
                }),),
            SizedBox(height:24.0,),
            Padding(padding:EdgeInsets.symmetric(horizontal:24.0),child:customTextFormField(labelText:'Last Name',
                isPassword:false,
                textType:TextInputType.name ,controller:lastNameController,validator:(value)
                {
                  if(value!.isEmpty)
                  {
                    return 'This Field Must Not Be Empty!';
                  }
                  return null;
                }),),
            SizedBox(height:24.0,),
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
            SizedBox(height:24.0,),
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
            SizedBox(height:16.0,),
            Padding(padding:EdgeInsets.only(left:12.0),child:TermsAndConditionWidget(),),
            SizedBox(height:44.0,),
            ConditionalBuilder(condition:state is !LoadingCreateUserWithEmailAndPassword,
                builder:(context)=>Padding(padding:EdgeInsets.symmetric(horizontal:24.0),child:customButton(width:343,height:56,color:AuthCubit.get(context).termsAndConditionCheckBoxValue == false ? Colors.grey :AppColors.primaryColor,borderRadius:BorderRadius.circular(8.0),textButton:'Sign Up',
                    textStyle:CustomTextStyles.poppins500style24.copyWith(fontSize:18,color:AppColors.offWhite),onPressed:()
                    async {
                      if(AuthCubit.get(context).termsAndConditionCheckBoxValue == true)
                      {
                        if(formKey.currentState!.validate())
                        {
                          await AuthCubit.get(context).createUserWithEmailAndPassword(emailAddress:emailController.text,password:passwordController.text,firstName:firstNameController.text,lastName:lastNameController.text);
                        }
                      }
                    }),),
                fallback:(context)=>Center(child:CircularProgressIndicator(
                  color:AppColors.primaryColor,
                ),)),
            SizedBox(height:16.0,),
            buttonAndText(text:'Already have an account ?',buttonText:'Sign In',onPressed:()
            {
              customReplacementNavigate(context,SignInScreen());
            }),
          ],
        )
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
      Fluttertoast.showToast
        (
        msg:'Successfully,Check Your Email To Verify Your Account',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      customReplacementNavigate(context,SignInScreen());
    }
  }),
);