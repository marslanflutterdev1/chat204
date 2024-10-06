// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import '../styles/custom_color_style.dart';
import '../utils/custom_utils.dart';

class custom_check_user_row extends StatelessWidget {
  const custom_check_user_row({
    super.key,
    this.text = "Don't have an Account:",
    this.btnText = "SIGN-UP",
    this.onPressed,
  });

  final String? text;
  final String? btnText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(),
        const Spacer(),
        Text(
          "$text",
          style: CustomUtils.customTextStyle(
            color: Colors.blueGrey,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            // fontFamily: "Lobster",
          ),
        ),
        TextButton(
          style: const ButtonStyle(
            padding: WidgetStatePropertyAll(
              EdgeInsets.all(0),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            "$btnText",
            style: CustomUtils.customTextStyle(
              color: customColorStyle.primaryColor,
              fontSize: 18,
              //fontWeight: FontWeight.bold,
              fontFamily: "Lobster",
            ),
          ),
        ),
      ],
    );
  }
}
