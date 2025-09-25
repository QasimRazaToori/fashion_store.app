import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/Navigation_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustumBottomNavbar extends StatelessWidget {
  const CustumBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController =
        Get.find<NavigationController>();
    return Obx(() => BottomNavigationBar(
            currentIndex: navigationController.currentIndex.value,
            onTap: (index) => navigationController.changeIndex(index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                label: 'Shopping',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                label: 'Wishlist',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Account',
              )
            ]));
  }
}
