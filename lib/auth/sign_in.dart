import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utiles/app_textstyle.dart';
import 'package:flutter_application_1/auth/custum_textfield.dart';
import 'package:flutter_application_1/auth/forgot_pass.dart';
import 'package:flutter_application_1/auth/sing_up.dart';

import 'package:flutter_application_1/splash/auth_cont.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class SignInscreen extends StatelessWidget {
  SignInscreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Text(
              "Welcome Back!",
              style: AppTextStyle.withColor(AppTextStyle.h1,
                  Theme.of(context).textTheme.bodyLarge!.color!),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Sign in to continue shopping",
              style: AppTextStyle.withColor(
                AppTextStyle.BodyLarge,
                isDark ? Colors.grey[400]! : Colors.grey[600]!,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            CustumtextField(
              lebel: "Email",
              prefixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                } else if (!GetUtils.isEmail(value)) {
                  return 'please enter a valid email';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 16,
            ),
            CustumtextField(
              lebel: "Password",
              prefixIcon: Icons.lock_clock_outlined,
              keyboardType: TextInputType.visiblePassword,
              isPassword: true,
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Password';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 15,
            ),
            Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    _handleSignIn();
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: AppTextStyle.withColor(
                        AppTextStyle.ButtonMedium,
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                )),
            SizedBox(
              width: double.infinity,
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding:
                        EdgeInsets.symmetric(vertical: 18, horizontal: 180),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: Text(
                  'Sign In',
                  style: AppTextStyle.withColor(
                      AppTextStyle.ButtonMedium, Colors.white),
                )),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an acount?",
                  style: AppTextStyle.withColor(AppTextStyle.BodyMeddium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => SingUpScreen());
                  },
                  child: Text('Sign Up',
                      style: AppTextStyle.withColor(
                        AppTextStyle.ButtonMedium,
                        Theme.of(context).primaryColor,
                      )),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}

void _handleSignIn() {
  final AuthController authController = Get.find<AuthController>();
  authController.login();
  Get.offAll(() => const ForgetPasswordScreen());
}
