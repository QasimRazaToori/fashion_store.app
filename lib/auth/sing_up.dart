import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utiles/app_textstyle.dart';
import 'package:flutter_application_1/auth/custum_textfield.dart';
import 'package:flutter_application_1/auth/sign_in.dart';
import 'package:flutter_application_1/home/main_Screen.dart';
import 'package:get/get.dart';

class SingUpScreen extends StatelessWidget {
  SingUpScreen({super.key});

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _EmailController = TextEditingController();

  final TextEditingController _PasswordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Create Account",
              style: AppTextStyle.withColor(AppTextStyle.h1,
                  Theme.of(context).textTheme.bodyLarge!.color!),
            ),
            const SizedBox(
              height: 8,
            ),
            Text("Signup to get started",
                style: AppTextStyle.withColor(
                  AppTextStyle.BodyLarge,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!,
                )),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustumtextField(
                lebel: "Full Name",
                prefixIcon: Icons.person_outline,
                keyboardType: TextInputType.name,
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Name';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustumtextField(
                lebel: "Email",
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                controller: _EmailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Email';
                  }
                  if (!GetUtils.isEmail(value)) {
                    return "Please enter the valid email";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustumtextField(
                lebel: "Password",
                prefixIcon: Icons.lock_outline,
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                controller: _PasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Name';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustumtextField(
                lebel: "Confirm Password",
                prefixIcon: Icons.lock_outline,
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                controller: _confirmPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your Name';
                  }
                  if (value != _PasswordController.text) {
                    return "Passwords do not match";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            SizedBox(
              height: 24,
            ),
            SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor),
                    onPressed: () => Get.off(() => MainScreen()),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      child: Text("Sign Up",
                          style: AppTextStyle.withColor(
                            AppTextStyle.ButtonMedium,
                            Colors.white,
                          )),
                    ),
                  ),
                )),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: AppTextStyle.withColor(
                    AppTextStyle.BodyMeddium,
                    isDark ? Colors.grey[400]! : Colors.grey[600]!,
                  ),
                ),
                TextButton(
                    onPressed: () => SignInscreen(),
                    child: Text(
                      'Sign In',
                      style: AppTextStyle.withColor(
                        AppTextStyle.BodyMeddium,
                        Theme.of(context).primaryColor,
                      ),
                    ))
              ],
            )
          ],
        ),
      )),
    );
  }
}
