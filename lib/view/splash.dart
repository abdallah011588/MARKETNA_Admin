
import 'dart:async';
import 'package:admin/core/constant/colors.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/check_internet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({
    Key? key,
  }) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  Timer? timer;
  var result;
  void goTo() {
    timer = Timer(const Duration(seconds: 2), () {
      Get.offAllNamed(AppRoutes.language);
    });
  }

   checkInternetConnection() async{
     result =await checkInternet();
    print(result);
  }

  @override
  void initState() {
    checkInternetConnection();
    goTo();
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 30, end: 50),
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
              builder: (context, double value, child) {
                return Text(
                  'Admin',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: value,
                    // fontFamily: 'PlayFairDisplay',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
