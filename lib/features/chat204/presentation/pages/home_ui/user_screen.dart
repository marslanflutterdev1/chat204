import 'package:chat204/features/chat204/presentation/styles/custom_color_style.dart';
import 'package:chat204/features/chat204/presentation/utils/custom_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat('kk:mm').format(DateTime.now());
    String hour = DateFormat('a').format(DateTime.now());

    // ignore: non_constant_identifier_names
    List<String> GroupName = [
      "Muhammad Arslan",
      "Muhammad Subhan",
      "Muhammad Azan"
    ];
    return ListView.separated(
      itemCount: GroupName.length, // Number of items
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          // onTap: () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (e) => const LiveChatScreen(),
          //     ),
          //   );
          // },
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border:
                    Border.all(color: customColorStyle.primaryColor, width: 3)),
            child: ClipOval(
              child: Image.asset(
                "Assets/Images/arslan.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            GroupName[index].toString(),
            style: CustomUtils.customTextStyle(
              color: customColorStyle.primaryColor.withOpacity(0.8),
              fontSize: 16,
              fontFamily: "Lobster",
            ),
          ),
          subtitle: Text(
            'Status',
            style: CustomUtils.customTextStyle(
              color: customColorStyle.textColor.withOpacity(0.8),
              fontSize: 14,
              fontFamily: "Lobster",
            ),
          ),
          trailing: Text(
            "$formattedTime $hour",
            style: CustomUtils.customTextStyle(
                fontSize: 10,
                fontFamily: "Lobster",
                color: customColorStyle.primaryColor),
          ),
        );
      },
    );
  }
}
