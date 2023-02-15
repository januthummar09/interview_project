import 'package:flutter/material.dart';

class CommonTextFild extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final int? maxLines;
  final bool? enable;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  const CommonTextFild({
    Key? key,
    this.controller,
    this.hintText,
    this.maxLines,
    this.enable,
    this.suffixIcon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enable ?? true,
      controller: controller,
      cursorColor: const Color(0xff383c42),
      maxLines: maxLines,
      onTap: onTap,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xff383c42),
          fontSize: 14,
        ),
        border: InputBorder.none,
        filled: true,
        fillColor: const Color(0xffF9F9F9),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xff0385BF),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xff8A8A8A),
          ),
        ),
      ),
    );
  }
}
