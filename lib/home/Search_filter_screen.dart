import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utiles/app_textstyle.dart';

class CustumSearchBar extends StatelessWidget {
  const CustumSearchBar({super.key});
  final isDark = Brightness == Brightness.dark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: TextField(
        style: AppTextStyle.withColor(AppTextStyle.BodyMeddium,
            Theme.of(context).textTheme.bodyLarge!.color ?? Colors.black),
        decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: AppTextStyle.withColor(AppTextStyle.ButtonMedium,
                isDark ? Colors.grey[400]! : Colors.grey[600]!),
            prefixIcon: Icon(
              Icons.search,
              color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
            ),
            suffixIcon: Icon(
              Icons.tune,
              color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
            ),
            filled: true,
            fillColor: isDark ? Colors.grey[800]! : Colors.grey[100],
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1,
                ))),
      ),
    );
  }
}
