// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '../../../../classes/app_colors.dart';
import '../../../../classes/app_text_styles.dart';
import '../../../data/models/on_boarding_model.dart';
import 'custom_smooth_page_indicator.dart';
class OnBoardingWidgetBody extends StatelessWidget {
  const OnBoardingWidgetBody({super.key, required this.controller,required this.onPageChanged});
  final PageController controller;
  final Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return Expanded(child:PageView.builder(
      onPageChanged:onPageChanged,
       physics:BouncingScrollPhysics(),
       controller:controller,
        itemCount:onBoardingData.length,
        itemBuilder:(context,index)=>SingleChildScrollView(
          physics:BouncingScrollPhysics(),
          child:Column(
          children:
          [
            Container(
              width:343,
              height:290,
              decoration:BoxDecoration(
                  image:DecorationImage(image:AssetImage(onBoardingData[index].image),fit:BoxFit.fill)
              ),
            ),
            SizedBox(height:24.0,),
            CustomSmoothPageIndicator(controller:controller),
            Text(onBoardingData[index].title,
              maxLines:4,
              overflow:TextOverflow.ellipsis,
              style:CustomTextStyles.poppins500style24.copyWith(color:AppColors.deepBrown),
              textAlign:TextAlign.center,),
            SizedBox(height:16,),
            Text(onBoardingData[index].subTitle,
              maxLines:3,
              overflow:TextOverflow.ellipsis,
              textAlign:TextAlign.center,
              style:CustomTextStyles.poppins500style24.copyWith(
                  color:AppColors.deepBrown,
                  fontSize:16,
                  fontWeight:FontWeight.w300
              ),),
          ],
        ),)));
  }
}