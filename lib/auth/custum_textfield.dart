import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utiles/app_textstyle.dart';

class CustumtextField extends StatefulWidget {
  final String lebel;
  final IconData prefixIcon;
  final TextInputType keyboardType;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  const CustumtextField(
      {super.key,
      required this.lebel,
      required this.prefixIcon,
      this.controller,
      this.isPassword = false,
      this.keyboardType = TextInputType.text,
      this.onChanged,
      this.validator});

  @override
  State<CustumtextField> createState() => _CustumtextFieldState();
}

class _CustumtextFieldState extends State<CustumtextField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword && _obscureText,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      onChanged: widget.onChanged,
      style: AppTextStyle.withColor(AppTextStyle.BodyMeddium,
          Theme.of(context).textTheme.bodyLarge!.color!),
      decoration: InputDecoration(
        labelText: widget.lebel,
        labelStyle: AppTextStyle.withColor(AppTextStyle.BodyMeddium,
            isDark ? Colors.grey[400]! : Colors.grey[600]!),
        prefixIcon: Icon(
          widget.prefixIcon,
          color: isDark ? Colors.grey[400] : Colors.grey[600],
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility))
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
      ),
    );
  }
}
