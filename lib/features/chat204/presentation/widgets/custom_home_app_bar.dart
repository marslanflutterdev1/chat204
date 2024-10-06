// ignore_for_file: unused_element

import 'package:flutter/material.dart';

import '../styles/custom_color_style.dart';
import '../utils/custom_utils.dart';

class CustomHomeAppBar extends StatefulWidget {
  const CustomHomeAppBar({super.key});

  @override
  State<CustomHomeAppBar> createState() => _CustomHomeAppBarState();
}

class _CustomHomeAppBarState extends State<CustomHomeAppBar> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    bool isSearch = false;

    SizedBox emptyContainer() {
      return const SizedBox(
        width: 0.0,
        height: 0.0,
      );
    }

    @override
    void dispose() {
      searchController.dispose();
      super.dispose();
    }

    PopupMenuItem customPopupMenuItem({String? title, IconData? icon}) {
      return PopupMenuItem(
        child: Row(
          children: [
            Icon(icon, size: 22, color: customColorStyle.primaryColor),
            const SizedBox(
              width: 8,
            ),
            Text(
              title!,
              style: CustomUtils.customTextStyle(
                  color: customColorStyle.primaryColor),
            ),
          ],
        ),
      );
    }

    return AppBar(
      title: isSearch == true
          ? emptyContainer()
          : Text(
              "Home Screen",
              style: CustomUtils.customTextStyle(
                  color: customColorStyle.backgroundColor,
                  fontSize: 25,
                  fontFamily: "Lobster"),
            ),
      centerTitle: true,
      backgroundColor: customColorStyle.primaryColor,
      flexibleSpace: isSearch == true
          ? Padding(
              padding: const EdgeInsets.only(
                  left: 16, top: 30, right: 16, bottom: 2),
              child: TextFormField(
                autofocus: true,
                obscureText: false,
                controller: searchController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                keyboardAppearance: Brightness.light,
                style: CustomUtils.customTextStyle(
                    color: customColorStyle.primaryColor,
                    fontSize: 16,
                    // fontWeight: FontWeight.bold,
                    fontFamily: "Lobster"),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: customColorStyle.backgroundColor,
                  hintText: "Search...",
                  hintStyle: CustomUtils.customTextStyle(
                    color: customColorStyle.primaryColor,
                    fontSize: 18,
                    // fontWeight: FontWeight.bold,
                    fontFamily: "Lobster",
                  ),
                  prefixIcon: Transform.rotate(
                    angle: 1.5,
                    child: Icon(
                      Icons
                          .search, // You can use Icons.search_rounded or other variations
                      size: 22,
                      color: customColorStyle.primaryColor,
                    ),
                  ),
                  suffixStyle: CustomUtils.customTextStyle(),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onFieldSubmitted: (value) {
                  setState(() {
                    isSearch = false;
                  });
                  searchController.clear();
                },
              ),
            )
          : emptyContainer(),
      actions: isSearch == true
          ? []
          : [
              InkWell(
                onTap: () {
                  setState(() {
                    isSearch = !isSearch;
                  });
                },
                child: Icon(
                  Icons.search_sharp,
                  size: 22,
                  color: customColorStyle.backgroundColor,
                ),
              ),
              const SizedBox(width: 4),
              PopupMenuButton(
                icon: Icon(
                  Icons.more_vert_sharp,
                  size: 22,
                  color: customColorStyle.backgroundColor,
                ),
                itemBuilder: (ctx) => [
                  customPopupMenuItem(
                      title: "Setting", icon: Icons.settings_sharp),
                  customPopupMenuItem(
                      title: "Upload", icon: Icons.upload_sharp),
                  customPopupMenuItem(title: "Copy", icon: Icons.copy_sharp),
                  customPopupMenuItem(
                      title: "Exit", icon: Icons.exit_to_app_sharp),
                ],
              ),
              const SizedBox(width: 6),
            ],
    );
  }
}
