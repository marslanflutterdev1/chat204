import 'package:chat204/custom_constants.dart';
import 'package:chat204/features/chat204/presentation/styles/custom_color_style.dart';
import 'package:chat204/features/chat204/presentation/utils/custom_utils.dart';
import 'package:chat204/features/chat204/presentation/widgets/custom_app_bar.dart';
import 'package:chat204/features/chat204/presentation/widgets/custom_button.dart';
import 'package:chat204/features/chat204/presentation/widgets/custom_check_user_row.dart';
import 'package:chat204/features/chat204/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController resetPasswordEmail = TextEditingController();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: custom_app_bar(title: "Forget Passwor Screen"),
        backgroundColor: customColorStyle.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Don't worry! Just fill in your email & Chat204 app will send you link to reset password",
                  textAlign: TextAlign.left,
                  style: CustomUtils.customTextStyle(
                      color: customColorStyle.primaryColor,
                      fontSize: 16,
                      fontFamily: "Lobster"),
                ),
                const SizedBox(height: 10),
                customTextFormField(
                  controller: resetPasswordEmail,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Please! Enter Email ",
                  suffixIcon: Icon(
                    Icons.email_sharp,
                    size: 22,
                    color: customColorStyle.backgroundColor,
                  ),
                ),
                const SizedBox(height: 10),
                custom_button(
                  text: "Send Password Reset Email",
                  onTap: () {},
                ),
                // const SizedBox(height: 10),
                custom_check_user_row(
                  text: "Remember account info! ",
                  btnText: "SIGN-IN",
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, CustomConstants.sign_in_screen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
