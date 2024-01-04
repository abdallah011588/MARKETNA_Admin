import 'package:admin/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData? suffixIcon;
  final TextEditingController controller;
  final String? Function(String?)? valid;
  final TextInputType? keyBoardType;
  final bool? password;
  final double? borderRadius;

  const CustomTextFormField({
    Key? key,
    required this.label,
    required this.hint,
    required this.suffixIcon,
    required this.controller,
    required this.valid,
    required this.keyBoardType,
    required this.borderRadius,
    this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: valid,
      keyboardType: keyBoardType,
      obscureText: password == null ? false : password == true ? true : false,
      decoration: InputDecoration(
        border:  OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
          borderSide:const BorderSide(color: AppColors.grey, width: 1),
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
          borderSide:const BorderSide(color: AppColors.primaryColor, width: 1),
        ),
        suffixIcon: Icon(suffixIcon),
        contentPadding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
        label: Text(label),
        suffixIconConstraints: BoxConstraints.tight(const Size(70, 20)),
        hintText: hint,
        hintStyle: const TextStyle(
          fontSize: 14,
        ),
        // labelStyle: const TextStyle(color: AppColors.primaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,

      ),
      minLines: 1,
      maxLines: 10,
      controller: controller,
    );
  }
}
