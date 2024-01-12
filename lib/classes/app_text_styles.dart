import 'package:flutter/material.dart';
import 'app_colors.dart';
abstract class CustomTextStyles
{
  static final pacifico400style64 = TextStyle(
    fontSize:64,
    fontWeight:FontWeight.w400,
    color:AppColors.deepBrown,
    fontFamily:'Pacifico',
  );
  static final poppins500style24 = TextStyle(
    fontSize:24,
    fontWeight:FontWeight.w500,
    color:Colors.black,
    fontFamily:'Poppins',
  );
  static final saira700style32 = TextStyle(
    fontSize:32,
    fontWeight:FontWeight.w700,
    color:Color(0xffFFFFFF),
    fontFamily:'Saira',
  );
}