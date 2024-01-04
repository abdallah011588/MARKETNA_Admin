import 'package:admin/core/constant/colors.dart';
import 'package:flutter/material.dart';
class CustomButtonAuth extends StatelessWidget {

  final String? text;
  final Color? color;
  final void Function()? onPressed;
  CustomButtonAuth({Key? key,required this.onPressed,required this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      child: MaterialButton(
        onPressed:onPressed,
        textColor: AppColors.white,
        color:color?? AppColors.primaryColor,
        child: Text(
          text!,
          style: TextStyle(
            // fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        shape: StadiumBorder(),
      ),
    );

  }
}
