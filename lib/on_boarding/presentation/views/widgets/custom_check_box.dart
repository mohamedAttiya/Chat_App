import 'package:flutter/material.dart';

import '../../../../bloc/auth_cubit.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});
  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}
class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool? value = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(4.0),
        ) ,
        activeColor:Colors.grey,
        side:BorderSide(
            color:Colors.grey
        ),
        value: value, onChanged:(newValue)
    {
      setState(() {
        value = newValue;
        AuthCubit.get(context).updateTermsAndConditionCheckBox(newValue: newValue);
      });
    });
  }
}