import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utiles/app_textstyle.dart';
import 'package:flutter_application_1/auth/custum_textfield.dart';
import 'package:flutter_application_1/auth/sign_in.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ForgetPasswordScreen extends StatelessWidget {
  final isDark = Brightness == Brightness.dark;
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () => Get.off(SignInscreen()),
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Reset Password',
                  style: AppTextStyle.withColor(AppTextStyle.h1,
                      Theme.of(context).textTheme.bodyLarge!.color!),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text('Enter your email to reset your password',
                    style: AppTextStyle.withColor(AppTextStyle.BodyLarge,
                        isDark ? Colors.grey[400]! : Colors.grey[600]!)),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustumtextField(
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
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      showSuccessDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        padding:
                            EdgeInsets.symmetric(vertical: 18, horizontal: 180),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: Text(
                      'Send Reset Link',
                      style: AppTextStyle.withColor(
                          AppTextStyle.ButtonMedium, Colors.white),
                    )),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

void showSuccessDialog(BuildContext context) {
  Get.dialog(AlertDialog(
    title: Text(
      'Check Your Email',
      style: AppTextStyle.h3,
    ),
    content: Text(
      'We have send password recovery instuctions to your email.',
      style: AppTextStyle.BodyMeddium,
    ),
    actions: [
      TextButton(
          onPressed: () => Get.back(),
          child: Text('OK',
              style: AppTextStyle.withColor(
                AppTextStyle.ButtonMedium,
                Theme.of(context).primaryColor,
              )))
    ],
  ));
}
