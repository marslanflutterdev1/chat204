part of 'credential_cubit.dart';

abstract class CredentialState extends Equatable {
  const CredentialState();

  @override
  List<Object> get props => [];
}

final class CredentialInitialState extends CredentialState {}

final class CredentialLoadingState extends CredentialState {}

final class CredentialLoadedState extends CredentialState {}

final class CredentialErrorState extends CredentialState {
  final String? errorMsg;

  const CredentialErrorState({this.errorMsg});
  @override
  List<Object> get props => [errorMsg!];
}
