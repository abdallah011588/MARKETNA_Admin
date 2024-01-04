
import 'package:flutter/material.dart';

class CustomButtonBottomNavigationBar extends StatelessWidget {
  final void Function()? onPress;
  final Widget childWidget;
  const CustomButtonBottomNavigationBar({Key? key, required this.onPress,required this.childWidget,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
      height: 50,
      shape:const CircleBorder(),
      onPressed: onPress,
      child: childWidget,
    );
  }
}
