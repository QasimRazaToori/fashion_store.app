import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utiles/app_textstyle.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Allproductscreen extends StatelessWidget {
  const Allproductscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios),
          color: isDark ? Colors.white : Colors.black,
        ),
        title: Text(
          'All Products ',
          style: AppTextStyle.withColor(
              AppTextStyle.h3, isDark ? Colors.white : Colors.black),
        ),
        actions: [
          //search icon
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
