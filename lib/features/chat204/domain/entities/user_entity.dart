import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? name;
  final String? email;
  final String? password;
  final String? uid;
  final String? status;
  final String? profileUrl;
  final String? phoneNumber;
  final String? isOnline;
  final String? gender;

  const UserEntity({
    this.name,
    this.email,
    this.password,
    this.uid,
    this.status,
    this.profileUrl,
    this.phoneNumber,
    this.isOnline,
    this.gender,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        password,
        uid,
        status,
        profileUrl,
        phoneNumber,
        isOnline,
        gender,
      ];
}
