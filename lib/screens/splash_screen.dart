// ignore_for_file: prefer_const_constructors
import 'package:chatting/classes/app_colors.dart';
import 'package:chatting/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:flutter/material.dart';
import '../classes/app_text_styles.dart';
import '../classes/navigation.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>
{
  @override
  void initState() {
    delayedNavigate(context,OnBoardingView());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:Text('Tawaswl',style:CustomTextStyles.pacifico400style64.copyWith(color:AppColors.deepBrown),),
      ),
    );
  }
}
void delayedNavigate(context,path)
{
  Future.delayed(Duration(seconds:3),()
  {
    customReplacementNavigate(context,path);
  }
  );
}