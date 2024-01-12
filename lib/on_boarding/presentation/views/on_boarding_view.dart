// ignore_for_file: prefer_const_constructors
import 'package:chatting/on_boarding/presentation/views/widgets/on_boarding_view_body.dart';
import 'package:chatting/screens/sign_up.dart';
import 'package:flutter/material.dart';
import '../../../classes/app_colors.dart';
import '../../../classes/app_text_styles.dart';
import '../../../classes/navigation.dart';
import '../../../constants/components.dart';
import '../../data/models/on_boarding_model.dart';
class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});
  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}
class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController controller = PageController(initialPage:0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
      body:Padding(padding:EdgeInsets.only(left:16.0,right:16.0,bottom:17.0),child:Column(
        children:
        [
          Padding(padding:EdgeInsets.only(top:40),child:Align(
            alignment:Alignment.centerRight,
            child:GestureDetector(
              onTap:()
              {
                customReplacementNavigate(context,SignUpScreen());
              },
              child:Text('Skip',style:CustomTextStyles.poppins500style24.copyWith(
                color:Colors.purple,
                fontSize:16.0,
                fontWeight:FontWeight.w400
            ),),),
          ),),
          OnBoardingWidgetBody(controller:controller,onPageChanged:(index)
          {
            setState(() {
              currentIndex = index ;
            });
          }),
          currentIndex==onBoardingData.length-1 ? Column(
            children:
            [
              customButton(width:343,height:56,color:AppColors.primaryColor,borderRadius:BorderRadius.circular(8.0),
                onPressed:()
                {
                  customReplacementNavigate(context,SignUpScreen());
                },
                textButton:'Create Account', textStyle:CustomTextStyles.poppins500style24.copyWith(fontSize:18,color:AppColors.offWhite),),
              SizedBox(height:16.0,),
              GestureDetector(
                onTap:()
                {
                  customReplacementNavigate(context,SignUpScreen());
                },
                child:Text('Login Now',style:CustomTextStyles.poppins500style24.copyWith(fontSize:16,fontWeight:FontWeight.w400,color:Colors.purple),),
              ),
            ],) :
          customButton(width:343,height:56,borderRadius:BorderRadius.circular(10.0),color:AppColors.primaryColor,textStyle:CustomTextStyles.poppins500style24.copyWith(fontSize:18.0,color:AppColors.offWhite),textButton:'Next',
            onPressed:()
            {
              controller.nextPage(duration:Duration(milliseconds:750),curve:Curves.fastEaseInToSlowEaseOut);
            }
          ),
        ],
      ),),
    ));
  }
}