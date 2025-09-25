import 'package:flutter/material.dart';
import 'package:flutter_application_1/Profile/acountScreen.dart';
import 'package:flutter_application_1/Utiles/custum_bottom_nav.dart';
import 'package:flutter_application_1/controller/Navigation_controller.dart';
import 'package:flutter_application_1/controller/theme_controller.dart';
import 'package:flutter_application_1/home/homescreen.dart';
import 'package:flutter_application_1/product/shopingScree.dart';
import 'package:flutter_application_1/product/wishlist_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController =
        Get.put(NavigationController());
    return GetBuilder<ThemeController>(
        builder: (themeController) => Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              body: AnimatedSwitcher(
                duration: Duration(milliseconds: 200),
                child: Obx(() => IndexedStack(
                      key: ValueKey(navigationController.currentIndex.value),
                      index: navigationController.currentIndex.value,
                      children: const [
                        Homescreen(),
                        ShopingScreen(),
                        WishlistScreen(),
                        Acountscreen(),
                      ],
                    )),
              ),
              bottomNavigationBar: const CustumBottomNavbar(),
            ));
  }
}
