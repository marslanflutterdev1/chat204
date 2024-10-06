// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import '../styles/custom_color_style.dart';
import '../utils/custom_utils.dart';

class CustomSearchTextFormField extends StatefulWidget {
  CustomSearchTextFormField(
      {super.key, required this.searchController, this.onFieldSubmitted});

  TextEditingController searchController = TextEditingController();
  void Function(String)? onFieldSubmitted;
  @override
  State<CustomSearchTextFormField> createState() =>
      _CustomSearchTextFormFieldState();
}

class _CustomSearchTextFormFieldState extends State<CustomSearchTextFormField> {
  bool isSearch = false;
  // @override
  // void dispose() {
  //   widget.searchController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      obscureText: false,
      controller: widget.searchController,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.text,
      keyboardAppearance: Brightness.light,
      onFieldSubmitted: widget.onFieldSubmitted,
      style: CustomUtils.customTextStyle(
          color: customColorStyle.primaryColor,
          fontSize: 16,
          fontFamily: "Lobster"),
      decoration: InputDecoration(
        filled: true,
        fillColor: customColorStyle.backgroundColor,
        hintText: "Search...",
        hintStyle: CustomUtils.customTextStyle(
          color: customColorStyle.primaryColor,
          fontSize: 18,
          fontFamily: "Lobster",
        ),
        prefixIcon: Transform.rotate(
          angle: 1.5,
          child: Icon(
            Icons.search,
            size: 22,
            color: customColorStyle.primaryColor,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50),
        ),
      ),

      // onFieldSubmitted: (value) {
      //   setState(() {
      //     isSearch = false;
      //   });
      //   widget.searchController.clear();
      // },
    );
  }
}
// TextFormField customSearchTextFormField() {
//     return TextFormField(
//       autofocus: true,
//       obscureText: false,
//       controller: searchController,
//       textInputAction: TextInputAction.done,
//       keyboardType: TextInputType.text,
//       keyboardAppearance: Brightness.light,
//       style: CustomUtils.customTextStyle(
//           color: customColorStyle.primaryColor,
//           fontSize: 16,
//           fontFamily: "Lobster"),
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: customColorStyle.backgroundColor,
//         hintText: "Search...",
//         hintStyle: CustomUtils.customTextStyle(
//           color: customColorStyle.primaryColor,
//           fontSize: 18,
//           fontFamily: "Lobster",
//         ),
//         prefixIcon: Transform.rotate(
//           angle: 1.5,
//           child: Icon(
//             Icons.search,
//             size: 22,
//             color: customColorStyle.primaryColor,
//           ),
//         ),
//         contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//         border: OutlineInputBorder(
//           borderSide: BorderSide.none,
//           borderRadius: BorderRadius.circular(50),
//         ),
//       ),
//       onFieldSubmitted: (value) {
//         setState(() {
//           isSearch = false;
//         });
//         searchController.clear();
//       },
//     );
//   }