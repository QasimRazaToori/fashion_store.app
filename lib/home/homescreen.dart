import 'package:flutter/material.dart'
    show
        AssetImage,
        BuildContext,
        CircleAvatar,
        Colors,
        Column,
        CrossAxisAlignment,
        EdgeInsets,
        FontWeight,
        Padding,
        Row,
        SafeArea,
        Scaffold,
        SizedBox,
        StatelessWidget,
        Text,
        TextStyle,
        Theme,
        Widget;
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/home/Sale_banner.dart';
import 'package:flutter_application_1/home/Search_filter_screen.dart';
import 'package:flutter_application_1/home/allProductScreen.dart';
import 'package:flutter_application_1/home/category_Screen.dart';
import 'package:flutter_application_1/home/product_grid.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/avatar.jpg'),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello Alex',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        Text(
                          'Good Morning',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const CustumSearchBar(),
              //category chips
              const CategoryChips(),
              //SaleBanner
              const SaleBannerr(),
              //popular product
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Popular Product',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () => Get.to(() => Allproductscreen()),
                      child: Text(
                        'See All',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
              //productGrid
              const Expanded(
                child: productGrid(),
              )
            ],
          ),
        ),
      )),
    );
  }
}
