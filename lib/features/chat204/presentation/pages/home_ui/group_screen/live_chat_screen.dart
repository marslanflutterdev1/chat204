import 'package:chat204/features/chat204/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class LiveChatScreen extends StatelessWidget {
  const LiveChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: custom_app_bar(title: "Live Chat"),
    );
  }
}
