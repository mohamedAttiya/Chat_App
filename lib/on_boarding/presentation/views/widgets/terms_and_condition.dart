import 'package:flutter/material.dart';
import '../../../../classes/app_colors.dart';
import '../../../../classes/app_text_styles.dart';
import 'custom_check_box.dart';
class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children:
      [
        CustomCheckBox(),
        Text.rich(TextSpan(children:
        [
          TextSpan(text:'I have agree to our',style:CustomTextStyles.poppins500style24.copyWith(
            fontSize:12,
            fontWeight:FontWeight.w400,
            color:AppColors.deepGrey,
          ),),
          TextSpan(text:' Terms and Condition',style:CustomTextStyles.poppins500style24.copyWith(
            decoration:TextDecoration.underline,
            fontSize:12,
            fontWeight:FontWeight.w400,
            color:AppColors.deepGrey,
          ),),
        ])),
      ],
    );
  }
}