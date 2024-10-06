import 'package:flutter/material.dart';
import '../styles/custom_color_style.dart';
import '../utils/custom_utils.dart';

// ignore: camel_case_types
class custom_button extends StatelessWidget {
  const custom_button({super.key, this.text = "Button", this.onTap});

  final String? text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          color: customColorStyle.primaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            "$text",
            style: CustomUtils.customTextStyle(
              color: customColorStyle.backgroundColor,
              fontSize: 18,
              //fontWeight: FontWeight.bold,
              fontFamily: "Lobster",
            ),
          ),
        ),
      ),
    );
  }
}
