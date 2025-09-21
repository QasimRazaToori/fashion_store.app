import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utiles/app_textstyle.dart';
import 'package:flutter_application_1/auth/sign_in.dart';
import 'package:flutter_application_1/splash/auth_cont.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Onboard_Screen extends StatefulWidget {
  const Onboard_Screen({super.key});

  @override
  State<Onboard_Screen> createState() => _Onboard_ScreenState();
}

class _Onboard_ScreenState extends State<Onboard_Screen> {
  final PageController _pagecontroller = PageController();
  int _currentPage = 0;
  final List<OnBoardingItem> _item = [
    OnBoardingItem("assets/images/intro.png", "Discover latest trend",
        "Explore the newest fashion  trends and find your unique style"),
    OnBoardingItem("assets/images/intro1.png", "Quality products",
        "Shop premium quality products from top brands worldwide"),
    OnBoardingItem("assets/images/intro2.png", "Easy Shopping",
        "Simple and secure shopping experience at your fingertips"),
  ];
  //handle get started button pressed
  void _handleGetsStated() {
    final AuthController authController = Get.find<AuthController>();
    authController.setfirstTimeDone();
    Get.off(const SignInscreen());
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(children: [
        PageView.builder(
            controller: _pagecontroller,
            itemCount: _item.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _item[index].image,
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    _item[index].title,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.withColor(
                      AppTextStyle.h1,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                      ),
                      child: Text(_item[index].description,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.withColor(
                            AppTextStyle.h3,
                            Theme.of(context).textTheme.bodySmall!.color!,
                          ))),
                ],
              );
            }),
        Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    _item.length,
                    (index) => AnimatedContainer(
                        duration: Duration(microseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        height: 8,
                        width: _currentPage == index ? 24 : 8,
                        decoration: BoxDecoration(
                            color: _currentPage == index
                                ? Theme.of(context).primaryColor
                                : (isDark
                                    ? Colors.grey[700]
                                    : Colors.grey[300]),
                            borderRadius: BorderRadius.circular(4)))))),
        Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => _handleGetsStated(),
                  child: Text(
                    "Skip",
                    style: AppTextStyle.withColor(AppTextStyle.ButtonMedium,
                        isDark ? Colors.grey[400]! : Colors.grey[600]!),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_currentPage < _item.length - 1) {
                        _pagecontroller.nextPage(
                          duration: Duration(microseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        _handleGetsStated();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(12),
                        )),
                    child: Text(
                      _currentPage < _item.length - 1 ? "Next" : "Get Started",
                      style: AppTextStyle.withColor(
                          AppTextStyle.ButtonMedium, Colors.white),
                    ))
              ],
            ))
      ]),
    );
  }
}

class OnBoardingItem {
  final String image;
  final String title;
  final String description;

  OnBoardingItem(
    this.image,
    this.title,
    this.description,
  );
}
