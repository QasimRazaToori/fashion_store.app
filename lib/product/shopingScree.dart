import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Utiles/app_textstyle.dart';
import 'package:flutter_application_1/home/category_Screen.dart';
import 'package:flutter_application_1/home/filter_bottom.dart';
import 'package:flutter_application_1/home/product_grid.dart';

class Shopingscree extends StatelessWidget {
  const Shopingscree({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
          title: Text(
            'Shoping',
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
            //filter icon
            IconButton(
              onPressed: () => FilterBottom.show(context),
              icon: Icon(
                Icons.filter_list,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ]),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: CategoryChips(),
          ),
          Expanded(
            child: productGrid(),
          ),
        ],
      ),
    );
  }
}
