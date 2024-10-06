import 'package:chat204/features/chat204/domain/entities/user_entity.dart';
import 'package:chat204/features/chat204/presentation/blocs/cubit/authentication/auth/auth_cubit/auth_cubit.dart';
import 'package:chat204/features/chat204/presentation/blocs/cubit/authentication/credential/credential_cubit/credential_cubit.dart';
import 'package:chat204/features/chat204/presentation/pages/home_ui/home_screen.dart';
import 'package:chat204/features/chat204/presentation/styles/custom_color_style.dart';
import 'package:chat204/features/chat204/presentation/widgets/custom_app_bar.dart';
import 'package:chat204/features/chat204/presentation/widgets/custom_button.dart';
import 'package:chat204/features/chat204/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isObscureText = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController conformPasswordController =
      TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    conformPasswordController.dispose();
    super.dispose();
  }

  void signUpClickMethod() {
    if (formKey.currentState!.validate()) {
      // Check if passwords match
      if (passwordController.text != conformPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Passwords do not match!")),
        );
        return;
      }

      BlocProvider.of<CredentialCubit>(context).signUpMethod(
        user: UserEntity(
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          status: "",
          profileUrl: "",
          phoneNumber: "",
          isOnline: "",
          gender: "",
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: custom_app_bar(title: "Sign-Up Screen"),
        backgroundColor: customColorStyle.backgroundColor,
        body: BlocConsumer<CredentialCubit, CredentialState>(
          listener: (context, state) {
            if (state is CredentialLoadedState) {
              BlocProvider.of<AuthCubit>(context).isSignInMethod();
            }
            if (state is CredentialErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Error: ${state.errorMsg}")),
              );
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
                  } else if (state is UnAuthenticationState) {
                    return const SignUpScreen();
                  } else {
                    return const Center(child: Text("Nothing..."));
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
                        controller: nameController,
                        obscureText: false,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        hintText: "Please! Enter Name...",
                        suffixIcon: Icon(
                          Icons.people_alt_sharp,
                          color: customColorStyle.backgroundColor,
                          size: 22,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Name cannot be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      customTextFormField(
                        controller: emailController,
                        obscureText: false,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        hintText: "Please! Enter Email...",
                        suffixIcon: Icon(
                          Icons.email_sharp,
                          color: customColorStyle.backgroundColor,
                          size: 22,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email cannot be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      customTextFormField(
                        controller: passwordController,
                        obscureText: isObscureText,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                        hintText: "Please! Enter Password...",
                        suffixIcon: IconButton(
                          icon: Icon(
                            isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: customColorStyle.backgroundColor,
                            size: 22,
                          ),
                          onPressed: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      customTextFormField(
                        controller: conformPasswordController,
                        obscureText: isObscureText,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        hintText: "Please! Enter Confirm Password...",
                        suffixIcon: IconButton(
                          icon: Icon(
                            isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: customColorStyle.backgroundColor,
                            size: 22,
                          ),
                          onPressed: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Confirm password cannot be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      custom_button(
                        text: "SIGN-UP",
                        onTap: signUpClickMethod,
                      ),
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


//lllllllllllllllllllllllllllllllllll
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final bool isObscureText = false;
//   final GlobalKey formKey = GlobalKey<FormState>();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController conformPasswordController =
//       TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     void signUpClickMethod() {
//       if (nameController.text.isEmpty) {
//         // toast-msg or snakbar use here.
//         return;
//       }
//       if (emailController.text.isEmpty) {
//         // toast-msg or snakbar use here.
//         return;
//       }

//       if (passwordController.text == conformPasswordController.text) {
//         // toast-msg or snakbar use here.
//         // contine
//       } else {
//         return;
//       }

//       // if (passwordController.text.isEmpty) {
//       //   // toast-msg or snakbar use here.
//       //   return;
//       // }

//       BlocProvider.of<CredentialCubit>(context).signUpMethod(
//           user: UserEntity(
//         name: nameController.text.trim().toString(),
//         email: emailController.text.trim().toString(),
//         password: passwordController.text.trim().toString(),
//         status: "",
//         profileUrl: "",
//         phoneNumber: "",
//         isOnline: "",
//         gender: "",
//       ));
//     }

//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         appBar: custom_app_bar(title: "Sign-Up Screen"),
//         backgroundColor: customColorStyle.backgroundColor,
//         body: BlocConsumer<CredentialCubit, CredentialState>(
//           listener: (context, state) {
//             // if (state is CredentialLoadingState) {
//             //   debugPrint("State Loading...");
//             // }
//             if (state is CredentialLoadedState) {
//               BlocProvider.of<AuthCubit>(context).isSignInMethod();
//             }
//             if (state is CredentialErrorState) {
//               debugPrint("State Error...");
//             }
//           },
//           builder: (context, state) {
//             if (state is CredentialLoadingState) {
//               return const Center(
//                 child: CircularProgressIndicator(
//                   color: Colors.pink,
//                   strokeWidth: 4,
//                 ),
//               );
//             }

//             if (state is CredentialLoadedState) {
//               return BlocBuilder<AuthCubit, AuthState>(
//                 builder: (BuildContext context, state) {
//                   if (state is AuthenticationState) {
//                     return HomeScreen(uid: state.uid);
//                   } else if (state is UnAuthenticationState) {
//                     return const SignUpScreen();
//                   } else {
//                     return const Center(child: Text("Nothing..."));
//                   }
//                 },
//               );
//             }

//             if (state is CredentialErrorState) {
//               debugPrint("State Error...");
//             }

//             return SafeArea(
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//                 child: Form(
//                   key: formKey,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       customTextFormField(
//                         controller: nameController,
//                         obscureText: isObscureText,
//                         textInputAction: TextInputAction.next,
//                         keyboardType: TextInputType.name,
//                         hintText: "Please! Enter Name...",
//                         suffixIcon: Icon(
//                           Icons.people_alt_sharp,
//                           color: customColorStyle.backgroundColor,
//                           size: 22,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       customTextFormField(
//                         controller: emailController,
//                         obscureText: isObscureText,
//                         textInputAction: TextInputAction.next,
//                         keyboardType: TextInputType.emailAddress,
//                         hintText: "Please! Enter Email...",
//                         suffixIcon: Icon(
//                           Icons.email_sharp,
//                           color: customColorStyle.backgroundColor,
//                           size: 22,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       customTextFormField(
//                         controller: passwordController,
//                         obscureText: isObscureText,
//                         textInputAction: TextInputAction.next,
//                         keyboardType: const TextInputType.numberWithOptions(
//                           signed: true,
//                           decimal: true,
//                         ),
//                         hintText: "Please! Enter Password...",
//                         suffixIcon: Icon(
//                           Icons.visibility_off_sharp,
//                           color: customColorStyle.backgroundColor,
//                           size: 22,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       customTextFormField(
//                         controller: conformPasswordController,
//                         obscureText: isObscureText,
//                         textInputAction: TextInputAction.done,
//                         keyboardType: TextInputType.visiblePassword,
//                         hintText: "Please! Enter Conform Password...",
//                         suffixIcon: Icon(
//                           Icons.visibility_off_sharp,
//                           color: customColorStyle.backgroundColor,
//                           size: 22,
//                         ),
//                       ),

//                       const SizedBox(
//                         height: 20,
//                       ),
//                       custom_button(
//                           text: "SIGN-UP",
//                           onTap: () async {
//                             signUpClickMethod();
//                             // Navigator.pushNamed(
//                             //   context,
//                             //   CustomConstants.sign_in_screen,
//                             // );
//                           }),
//                       // const SizedBox(
//                       //   height: 4,
//                       // ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
