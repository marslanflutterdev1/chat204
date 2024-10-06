import 'package:chat204/features/chat204/presentation/blocs/cubit/authentication/auth/auth_cubit/auth_cubit.dart';
import 'package:chat204/features/chat204/presentation/styles/custom_color_style.dart';
import 'package:chat204/features/chat204/presentation/utils/custom_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> popupMenuItemList = ["SignOut"];

    return PopupMenuButton(
      onSelected: (value) async {
        // final googleSignIn = GoogleSignIn();
        if (value == "SignOut") {
          await BlocProvider.of<AuthCubit>(context).signOutMethod();
          // await googleSignIn.signOut();
        }
      },
      icon: Icon(
        Icons.more_vert_sharp,
        size: 22,
        color: customColorStyle.backgroundColor,
      ),
      itemBuilder: (BuildContext context) => popupMenuItemList.map(
        (menuItem) {
          return PopupMenuItem(
            value: menuItem,
            child: Text(
              menuItem,
              style: CustomUtils.customTextStyle(
                color: customColorStyle.primaryColor,
                fontSize: 18,
                fontFamily: "Lobster",
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
