import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextStyle? hintStyle;
  void Function(String)? onSubmitted;
  void Function(String)? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final InputBorder? border;

  AppTextField({
    required this.controller,
    this.onChanged,
    this.onSubmitted,
    this.suffixIcon,
    super.key,
    this.prefixIcon,
    required this.hintText,
    this.hintStyle,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      controller: controller,
      onSubmitted: onSubmitted,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyle(color: Colors.white.withOpacity(0.2)),
        border: border ?? InputBorder.none,
      ),
    );
  }
}
