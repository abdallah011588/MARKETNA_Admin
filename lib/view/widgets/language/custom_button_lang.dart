import 'package:admin/core/constant/colors.dart';
import 'package:flutter/material.dart';
class CustomButtonLang extends StatelessWidget {

  final String? text;
  final void Function()? onPressed;
   CustomButtonLang({Key? key,required this.onPressed,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        onPressed:onPressed,
        textColor: AppColors.white,
        color: AppColors.primaryColor,
        child: Text(
          text!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

  }
}
