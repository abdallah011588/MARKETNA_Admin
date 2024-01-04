import 'package:admin/bindings/initial_bindings.dart';
import 'package:admin/core/constant/app_theme.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/localization/change_local.dart';
import 'package:admin/core/localization/translation.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) => runApp(const MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocaleController localeController=Get.put(LocaleController());
    return GetMaterialApp(
      title: 'Admin',
      theme: appLightTheme,
      initialRoute: AppRoutes.splash,
      debugShowCheckedModeBanner: false,
      getPages: routes,
      translations: AppTranslation(),
      initialBinding: InitialBindings(),
      locale: localeController.language,

    );
  }
}