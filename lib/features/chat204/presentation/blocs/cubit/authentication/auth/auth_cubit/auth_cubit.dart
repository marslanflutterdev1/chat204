import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:chat204/features/chat204/domain/use_cases/get_current_user_id_use_case.dart';
import 'package:chat204/features/chat204/domain/use_cases/is_sign_in_use_case.dart';
import 'package:chat204/features/chat204/domain/use_cases/sign_out_use_case.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IsSignInUseCase isSignInUseCase;
  final GetCurrentUserIdUseCase getCurrentUserIdUseCase;
  final SignOutUseCase signOutUseCase;
  AuthCubit({
    required this.isSignInUseCase,
    required this.getCurrentUserIdUseCase,
    required this.signOutUseCase,
  }) : super(AuthInitialState());

  // This method will be execute when app started.
  Future<void> startedAppMethod() async {
    try {
      // isSignInUseCase.isSignIn();  OR
      final isSignIn = await isSignInUseCase.isSignIn();
      if (isSignIn) {
        final uid = await getCurrentUserIdUseCase.getCurrentUserId();
        emit(AuthenticationState(uid: uid));
      } else {
        emit(UnAuthenticationState());
      }
    } on SocketException catch (_) {
      emit(UnAuthenticationState());
    } catch (_) {
      emit(UnAuthenticationState());
    }
  }

  // This method trigger when user sign out.
  Future<void> isSignInMethod() async {
    try {
      final uid = await getCurrentUserIdUseCase.getCurrentUserId();
      emit(AuthenticationState(uid: uid));
    } catch (_) {
      emit(UnAuthenticationState());
    }
  }

//  Future<void> signOutMethod() async {
//     try {
//       // Add your sign-out logic here, for example:
//       await FirebaseAuth.instance.signOut();
//       emit(AuthSignedOut()); // Emit a signed-out state
//     } catch (e) {
//       emit(AuthError(e.toString()));
//     }
//   }

  // This method trigger when user sign out.
  Future<void> signOutMethod() async {
    try {
      await signOutUseCase.signOut();
      emit(UnAuthenticationState());
    } catch (_) {
      emit(UnAuthenticationState());
    }
  }
}
