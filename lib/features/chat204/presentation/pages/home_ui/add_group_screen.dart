import 'package:chat204/features/chat204/presentation/styles/custom_color_style.dart';
import 'package:chat204/features/chat204/presentation/utils/custom_utils.dart';
import 'package:chat204/features/chat204/presentation/widgets/custom_app_bar.dart';
import 'package:chat204/features/chat204/presentation/widgets/custom_button.dart';
import 'package:chat204/features/chat204/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddGroupScreen extends StatelessWidget {
  const AddGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController groupNameController = TextEditingController();
    TextEditingController groupMamberController = TextEditingController();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: custom_app_bar(title: "Create New Group"),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Center(
                child: ClipOval(
                  child: Container(
                    height: 70,
                    width: 70,
                    color: Colors.red,
                    //  child: Image.asset("Assets/Images/arslan.jpg"),
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                "Add Group Image",
                style: CustomUtils.customTextStyle(
                    color: customColorStyle.primaryColor,
                    fontSize: 22,
                    fontFamily: "Lobster"),
              ),
              const SizedBox(height: 50),
              customTextFormField(
                controller: groupNameController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                hintText: "Group Name...",
                suffixIcon: Icon(
                  Icons.people_alt_sharp,
                  color: customColorStyle.backgroundColor,
                ),
              ),
              const SizedBox(height: 10),
              customTextFormField(
                controller: groupMamberController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                hintText: "Type Number Of Mamber...",
                suffixIcon: Icon(
                  Icons.email_sharp,
                  color: customColorStyle.backgroundColor,
                ),
              ),
              const SizedBox(height: 20),
              custom_button(
                text: "Create New Group",
                onTap: () {},
              )
            ],
          ),
        )),
      ),
    );
  }
}
