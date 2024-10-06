import 'package:chat204/features/chat204/presentation/pages/home_ui/home_screen.dart';
import 'package:chat204/features/chat204/presentation/pages/sign_in_ui/sign_in_screen.dart';
import 'package:chat204/on_generate_routes.dart';
import 'package:chat204/features/chat204/presentation/blocs/cubit/authentication/auth/auth_cubit/auth_cubit.dart';
import 'package:chat204/features/chat204/presentation/blocs/cubit/authentication/credential/credential_cubit/credential_cubit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'dependence_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
            create: (context) => di.sl<AuthCubit>()..startedAppMethod()),
        BlocProvider<CredentialCubit>(
            create: (context) => di.sl<CredentialCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.light,
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: OnGenerateRoutes.setRoute,
        initialRoute: "/",
        routes: {
          "/": (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (BuildContext context, state) {
                if (state is AuthenticationState) {
                  return HomeScreen(uid: state.uid);
                } else {
                  return const SignInScreen();
                }
              },
            );
          },
          // "sign_in_screen": (context) => const SignInScreen(),
          // "forget_password_screen": (context) => const ForgetPasswordScreen(),
        },
      ),
    );
  }
}
