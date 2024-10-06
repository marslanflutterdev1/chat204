import 'package:chat204/features/chat204/presentation/styles/custom_color_style.dart';
import 'package:chat204/features/chat204/presentation/utils/custom_utils.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class customTextFormField extends StatelessWidget {
  const customTextFormField({
    super.key,
    this.controller,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.hintText = "Plese! Fill Fields...",
    this.suffixIcon = const Padding(
      padding: EdgeInsets.only(left: 0, right: 0),
      child: Icon(
        Icons.icecream,
        size: 22,
        color: Colors.white,
      ),
    ),
    this.validator,
  });
  // Initialize variables.
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? hintText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      obscureText: obscureText,
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      keyboardAppearance: Brightness.light,
      validator: validator,
      style: CustomUtils.customTextStyle(
          color: customColorStyle.backgroundColor,
          fontSize: 18,
          // fontWeight: FontWeight.bold,
          fontFamily: "Lobster"),
      decoration: InputDecoration(
        filled: true,
        fillColor: customColorStyle.primaryColor,
        hintText: hintText,
        hintStyle: CustomUtils.customTextStyle(
          color: customColorStyle.backgroundColor,
          fontSize: 18,
          // fontWeight: FontWeight.bold,
          fontFamily: "Lobster",
        ),
        // suffixIcon: Padding(
        //   padding: const EdgeInsets.only(left: 8, right: 20),
        //   child: Icon(
        //     Icons.email_sharp,
        //     size: 24,
        //     color: customColorStyle.backgroundColor,
        //   ),
        // ),
        suffixIcon: suffixIcon,
        suffixStyle: CustomUtils.customTextStyle(),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
