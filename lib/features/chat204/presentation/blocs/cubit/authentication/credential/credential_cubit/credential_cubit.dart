// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:chat204/features/chat204/domain/entities/user_entity.dart';
import 'package:chat204/features/chat204/domain/use_cases/forget_password_use_case.dart';
import 'package:chat204/features/chat204/domain/use_cases/get_create_current_user_use_case.dart';
import 'package:chat204/features/chat204/domain/use_cases/google_auth_use_case.dart';
import 'package:chat204/features/chat204/domain/use_cases/sign_in_use_case.dart';
import 'package:chat204/features/chat204/domain/use_cases/sign_up_use_case.dart';
import 'package:equatable/equatable.dart';
part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final GetCreateCurrentUserUseCase getCreateCurrentUserUseCase;
  final GoogleAuthUseCase googleAuthUseCase;

  CredentialCubit({
    required this.signInUseCase,
    required this.signUpUseCase,
    required this.forgetPasswordUseCase,
    required this.getCreateCurrentUserUseCase,
    required this.googleAuthUseCase,
  }) : super(CredentialInitialState());

  Future<void> signInMethod({required UserEntity user}) async {
    emit(CredentialLoadingState());
    try {
      await signInUseCase.signIn(user);
      emit(CredentialLoadedState());
    } on SocketException catch (_) {
      emit(CredentialErrorState());
    } catch (_) {
      emit(CredentialErrorState());
    }
  }

  Future<void> signUpMethod({required UserEntity user}) async {
    emit(CredentialLoadingState());
    try {
      await signUpUseCase.signUp(user);
      await getCreateCurrentUserUseCase.getCreateCurrentUser(user);
      emit(CredentialLoadedState());
    } on SocketException catch (_) {
      emit(CredentialErrorState());
    } catch (_) {
      emit(CredentialErrorState());
    }
  }

  Future<void> googleSignInMethod() async {
    emit(CredentialLoadingState());
    try {
      await googleAuthUseCase.googleAuth();
      emit(CredentialLoadedState());
    } on SocketException catch (_) {
      emit(CredentialErrorState());
    } catch (_) {
      emit(CredentialErrorState());
    }
  }

  Future<void> forgetPasswordMethod({required UserEntity user}) async {
    try {
      await signInUseCase.signIn(user);
      await forgetPasswordUseCase.forgetPassword(user.email!);
    } on SocketException catch (_) {
      emit(CredentialErrorState());
    } catch (_) {
      emit(CredentialErrorState());
    }
  }
}
