

import 'package:admin/core/class/request_status.dart';
import 'package:admin/core/constant/colors.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class SettingController extends GetxController
{
  List data = [];
  late RequestStatus requestStatus ;

  MyServices myServices=Get.find();
  bool notification=true;
  String? language;
  String? theme;


  void changeLanguage(lang)
  {
    language=lang;
    if(lang=="Arabic")
      {
        myServices.shared!.setString("lang","ar");
        Locale locale = Locale("ar");
        Get.updateLocale(locale);
      }
    else
      {
        myServices.shared!.setString("lang","en");
        Locale locale = Locale("en");
        Get.updateLocale(locale);
      }
    update();
  }
  void changeTheme(appearance)
  {
    theme=appearance;
    myServices.shared!.setString("theme",appearance);
    update();
  }

  void changeNotification()
  {
    notification=!notification;
    update();
  }

  logOut() {
    myServices.shared!.setBool("isLogin", false).then((value) {
      String userId= myServices.shared!.getString("id")!;
      FirebaseMessaging.instance.unsubscribeFromTopic("delivery");
      FirebaseMessaging.instance.unsubscribeFromTopic("delivery${userId}");
      print(myServices.shared!.getBool("isLogin"));
      Get.offAllNamed(AppRoutes.login);
    });
  }

  showAppearanceModal( ) {
    Get.bottomSheet(
        Container(
          padding: EdgeInsets.all(16),
          height: 320,
          decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.grey.shade900 : Colors.grey.shade200,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select a Theme".tr, style: TextStyle(color: AppColors.black,fontSize: 17)),
              SizedBox(height: 32),
              ListTile(
                leading: Icon(Icons.brightness_5, color: Colors.blue,),
                title: Text("Light".tr, style: TextStyle(color: AppColors.grey,fontSize: 17)),
                onTap: () {
                  changeTheme("Light");
                  Get.back();
                },
                trailing: Icon(Icons.check, color: theme == 'Light' ? Colors.blue : Colors.transparent,),
              ),
              SizedBox(height: 16),
              ListTile(
                leading: Icon(Icons.brightness_2, color: Colors.orange,),
                title: Text("Dark".tr, style: TextStyle(color: AppColors.grey,fontSize: 17)),
                onTap: () {
                  changeTheme("Dark");
                  Get.back();
                },
                trailing: Icon(Icons.check, color: theme == 'Dark' ? Colors.orange : Colors.transparent,),
              ),
              SizedBox(height: 16),
              ListTile(
                leading: Icon(Icons.brightness_6, color: Colors.blueGrey,),
                title: Text("System".tr, style:TextStyle(color: AppColors.grey,fontSize: 17)),
                onTap: () {
                  changeTheme("System");
                  Get.back();
                },
                trailing: Icon(Icons.check, color: theme == 'System' ? Colors.blueGrey : Colors.transparent,),
              ),
            ],
          ),
        )
    );
  }

  showLanguageModal() {
    Get.bottomSheet(
        Container(
          padding: EdgeInsets.all(16),
          height: 250,
          decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.grey.shade900 : Colors.grey.shade200,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select a Language".tr, style: TextStyle(color: AppColors.black,fontSize: 17)),
              SizedBox(height: 32),
              ListTile(
                leading: Icon(Icons.language_outlined, color: Colors.blue,),
                title: Text("English".tr, style: TextStyle(color: AppColors.grey,fontSize: 17)),
                onTap: () {
                  changeLanguage("English");
                  Get.back();
                },
                trailing: Icon(Icons.check, color: language == 'English' ? Colors.blue : Colors.transparent,),
              ),
              SizedBox(height: 16),
              ListTile(
                leading: Icon(Icons.language_outlined, color: Colors.orange,),
                title: Text("Arabic".tr, style: TextStyle(color: AppColors.grey,fontSize: 17)),
                onTap: () {
                  changeLanguage("Arabic");
                  Get.back();
                },
                trailing: Icon(Icons.check, color: language == 'Arabic' ? Colors.orange : Colors.transparent,),
              ),
            ],
          ),
        )
    );
  }






  @override
  void onInit() {
   language = myServices.shared!.getString("lang")=="ar"?"Arabic":"English";
   theme = myServices.shared!.getString("theme")==null?"Light": myServices.shared!.getString("theme");
    super.onInit();
  }

}
