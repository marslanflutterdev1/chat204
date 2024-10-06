part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitialState extends AuthState {}

final class AuthenticationState extends AuthState {
  final String uid;
  const AuthenticationState({required this.uid});

  @override
  List<Object> get props => [uid];
}

final class UnAuthenticationState extends AuthState {}
