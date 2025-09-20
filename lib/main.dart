import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utiles/app_theme.dart';
import 'package:flutter_application_1/controller/theme_controller.dart';
import 'package:flutter_application_1/splash/auth_cont.dart';
import 'package:flutter_application_1/splash/splashcreen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  Get.put(ThemeController());
  Get.put(AuthController());
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fashion Store',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeController.theme,
      defaultTransition: Transition.fade,
      home: Splash_Screen(),
    );
  }
}
