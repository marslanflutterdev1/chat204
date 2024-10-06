import 'package:chat204/custom_constants.dart';
import 'package:chat204/features/chat204/domain/entities/user_entity.dart';
import 'package:chat204/features/chat204/presentation/styles/custom_color_style.dart';
import 'package:chat204/features/chat204/presentation/utils/custom_utils.dart';
import 'package:chat204/features/chat204/presentation/widgets/custom_app_bar.dart';
import 'package:chat204/features/chat204/presentation/widgets/custom_button.dart';
import 'package:chat204/features/chat204/presentation/widgets/custom_check_user_row.dart';
import 'package:chat204/features/chat204/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/cubit/authentication/auth/auth_cubit/auth_cubit.dart';
import '../../blocs/cubit/authentication/credential/credential_cubit/credential_cubit.dart';
import '../home_ui/home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final bool isObscureText = false;
  final GlobalKey formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void signInClickMethod() {
      if (emailController.text.isEmpty) {
        // toast-msg or snakbar use here.
        return;
      }

      if (passwordController.text.isEmpty) {
        // toast-msg or snakbar use here.
        return;
      }

      BlocProvider.of<CredentialCubit>(context).signInMethod(
          user: UserEntity(
        email: emailController.text.trim().toString(),
        password: passwordController.text.trim().toString(),
      ));
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: custom_app_bar(title: "Sign-In Screen"),
        backgroundColor: customColorStyle.backgroundColor,
        body: BlocConsumer<CredentialCubit, CredentialState>(
          listener: (context, state) {
            if (state is CredentialLoadingState) {
              debugPrint("State Loading...");
            }
            if (state is CredentialLoadedState) {
              BlocProvider.of<AuthCubit>(context).isSignInMethod();
            }
            if (state is CredentialErrorState) {
              debugPrint("State Error...");
            }
          },
          builder: (context, state) {
            if (state is CredentialLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.pink,
                  strokeWidth: 4,
                ),
              );
            }

            if (state is CredentialLoadedState) {
              return BlocBuilder<AuthCubit, AuthState>(
                builder: (BuildContext context, state) {
                  if (state is AuthenticationState) {
                    return HomeScreen(uid: state.uid);
                  } else {
                    return const SignInScreen();
                  }
                },
              );
            }
            return SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      customTextFormField(
                        controller: emailController,
                        obscureText: isObscureText,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        hintText: "Please! Enter Email...",
                        suffixIcon: Icon(
                          Icons.email_sharp,
                          color: customColorStyle.backgroundColor,
                          size: 22,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      customTextFormField(
                        controller: passwordController,
                        obscureText: isObscureText,
                        textInputAction: TextInputAction.done,
                        keyboardType: const TextInputType.numberWithOptions(
                          signed: true,
                          decimal: true,
                        ),
                        hintText: "Please! Enter Password...",
                        suffixIcon: Icon(
                          Icons.visibility_off_sharp,
                          color: customColorStyle.backgroundColor,
                          size: 22,
                        ),
                      ),
                      // const SizedBox(
                      //   height: 4,
                      // ),
                      Row(
                        children: [
                          const SizedBox(),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context,
                                  CustomConstants.forget_password_screen);
                            },
                            style: const ButtonStyle(
                              padding: WidgetStatePropertyAll(
                                EdgeInsets.all(0),
                              ),
                            ),
                            child: Text(
                              "Forget Password?",
                              style: CustomUtils.customTextStyle(
                                color: customColorStyle.primaryColor,
                                fontSize: 18,
                                //fontWeight: FontWeight.bold,
                                fontFamily: "Lobster",
                              ),
                            ),
                          ),
                        ],
                      ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      custom_button(
                        text: "SIGN-IN",
                        onTap: signInClickMethod,
                        // onTap: (){signInClickMethod();
                        // // Navigator.pushReplacementNamed(
                        // // context, CustomConstants.home_screen);
                        // }
                      ),
                      // const SizedBox(
                      //   height: 4,
                      // ),
                      custom_check_user_row(
                        text: "Don't have an Account:",
                        btnText: "SIGN-UP",
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            CustomConstants.sign_up_screen,
                          );
                        },
                      ),

                      custom_button(
                        text: "GOOGLE",
                        onTap: () {
                          BlocProvider.of<CredentialCubit>(context)
                              .googleSignInMethod();
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
