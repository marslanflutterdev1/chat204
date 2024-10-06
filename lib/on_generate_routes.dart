import 'package:chat204/custom_constants.dart';
import 'package:chat204/features/chat204/presentation/pages/forget_password_ui/forget_password_screen.dart';
import 'package:chat204/features/chat204/presentation/pages/home_ui/home_screen.dart';
import 'package:chat204/features/chat204/presentation/pages/sign_in_ui/sign_in_screen.dart';
import 'package:chat204/features/chat204/presentation/pages/sign_up_ui/sign_up_screen.dart';
import 'package:chat204/features/chat204/presentation/styles/custom_color_style.dart';
import 'package:chat204/features/chat204/presentation/utils/custom_utils.dart';
import 'package:flutter/material.dart';

class OnGenerateRoutes {
  static Route<dynamic> setRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      // This is 1 screen.
      case CustomConstants.sign_in_screen:
        {
          return materialPageRoute(widget: const SignInScreen());
        }
      // This is 2 screen.
      case CustomConstants.sign_up_screen:
        {
          return materialPageRoute(widget: const SignUpScreen());
        }
      // This is 3 screen
      case CustomConstants.forget_password_screen:
        {
          return materialPageRoute(widget: const ForgetPasswordScreen());
        }
      // This is 4 screen
      case CustomConstants.home_screen:
        {
          return materialPageRoute(
              widget: const HomeScreen(
            uid: "",
          ));
        }
      // This is default screen
      default:
        return materialPageRoute(widget: const DefaultPageRoute());
    }
  }
}

MaterialPageRoute materialPageRoute({required Widget widget}) {
  return MaterialPageRoute(builder: (context) => widget);
}

class DefaultPageRoute extends StatelessWidget {
  const DefaultPageRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customColorStyle.backgroundColor,
      body: Center(
        child: Text(
          "DefaultErrorPageRoute",
          style: CustomUtils.customTextStyle(
              color: customColorStyle.primaryColor, fontFamily: "Lobster"),
        ),
      ),
    );
  }
}
