// ignore: non_constant_identifier_names
import 'package:chat204/features/chat204/presentation/styles/custom_color_style.dart';
import 'package:chat204/features/chat204/presentation/utils/custom_utils.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
AppBar custom_app_bar({
  String? title,
  List<Widget>? actions,
}) {
  return AppBar(
    title: Text(
      "$title",
      style: CustomUtils.customTextStyle(
        color: customColorStyle.backgroundColor,
        fontSize: 25,
        // fontWeight: FontWeight.bold,
        fontFamily: "Lobster",
      ),
    ),
    actions: actions,
    centerTitle: true,
    backgroundColor: customColorStyle.primaryColor,
  );
}
