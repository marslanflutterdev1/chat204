import 'package:chat204/features/chat204/presentation/styles/custom_color_style.dart';
import 'package:chat204/features/chat204/presentation/utils/custom_utils.dart';
import 'package:chat204/features/chat204/presentation/widgets/custom_button.dart';
import 'package:chat204/features/chat204/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController userController = TextEditingController();
    TextEditingController whatsAppController = TextEditingController();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Center(
                  child: ClipOval(
                    child: Container(
                      height: 70,
                      width: 70,
                      color: Colors.red,
                      child: Image.asset("Assets/Images/arslan.jpg"),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Remove Profile Picture",
                  style: CustomUtils.customTextStyle(
                      color: customColorStyle.primaryColor,
                      fontSize: 22,
                      fontFamily: "Lobster"),
                ),
                const SizedBox(height: 20),
                customTextFormField(
                  controller: userController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  hintText: "Please! Enter User Name...",
                  suffixIcon: Icon(
                    Icons.people_alt_sharp,
                    color: customColorStyle.backgroundColor,
                  ),
                ),
                const SizedBox(height: 10),
                customTextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Please! Enter Email...",
                  suffixIcon: Icon(
                    Icons.email_sharp,
                    color: customColorStyle.backgroundColor,
                  ),
                ),
                const SizedBox(height: 10),
                customTextFormField(
                  controller: whatsAppController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  hintText: "Hi! I'm use WhatsApp...",
                  suffixIcon: Icon(
                    Icons.whatshot_sharp,
                    color: customColorStyle.backgroundColor,
                  ),
                ),
                const SizedBox(height: 20),
                custom_button(
                  text: "Updata Profile",
                  onTap: () {},
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
