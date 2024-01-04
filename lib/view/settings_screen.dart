import 'package:admin/controller/setting_controller.dart';
import 'package:admin/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SettingController());
    return GetBuilder<SettingController>(
        builder: (controller) {
          return NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll){
              overScroll.disallowIndicator();
              return true;
            },
            child: ListView(
              children: [
                _buildListTile('2'.tr, Icons.dark_mode, controller.theme!.tr, Colors.purple, onTab: () =>controller.showAppearanceModal()),
                Divider(color: AppColors.black),
                _buildListTile('1'.tr, Icons.language, controller.language!.tr, Colors.orange, onTab: ()=>controller.showLanguageModal()),
                Divider(color: AppColors.black),
                ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  contentPadding: EdgeInsets.all(0),
                  leading: Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue.withAlpha(30)
                    ),
                    child: Center(
                      child: Icon(Icons.notifications_none_outlined, color: Colors.blue,),
                    ),
                  ),
                  title: Text("Notifications".tr, style: TextStyle(color: AppColors.black,fontSize: 17)),
                  trailing: Switch(
                      value: controller.notification,
                      activeColor: AppColors.primaryColor,
                      onChanged: (value){
                        controller.changeNotification();
                      }),
                ),
                Divider(color: AppColors.black),
                _buildListTile('Help Center'.tr, Icons.help, '', Colors.green, onTab: () {}),
                Divider(color: AppColors.black),
                _buildListTile('Logout'.tr, Icons.exit_to_app, '', Colors.red,
                    onTab: (){
                      Get.defaultDialog(
                        title: "Information".tr,
                        middleText: "Do you want to log out".tr,
                        actions: <Widget>[
                          TextButton(
                            child: Text("Yes".tr),
                            onPressed: () {
                              controller.logOut();
                            },
                          ),
                          TextButton(
                            child: Text("Close".tr),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ],
                      );
                    }
                ),
                Divider(color: AppColors.black),
                SizedBox(height: 20,),

              ],
            ),
          );
        }
    );

  }
}

Widget _buildListTile(String title, IconData icon, String trailing, Color color, {onTab}) {
  return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      contentPadding: EdgeInsets.all(0),
      leading: Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withAlpha(30)
        ),
        child: Center(
          child: Icon(icon, color: color,),
        ),
      ),
      title: Text(title, style: TextStyle(color: AppColors.black,fontSize: 17)),
      trailing: Container(
        width: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(trailing, style: TextStyle(color: AppColors.lightGery,fontSize: 17)),
            Icon(Icons.arrow_forward_ios, size: 16,),
          ],
        ),
      ),
      onTap: onTab
  );
}
