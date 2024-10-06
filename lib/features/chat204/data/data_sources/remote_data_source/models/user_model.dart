// ignore_for_file: use_super_parameters

import 'package:chat204/features/chat204/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends UserEntity {
  const UserModel({
    final String? name,
    final String? email,
    final String? password,
    final String? uid,
    final String? status,
    final String? profileUrl,
    final String? phoneNumber,
    final String? isOnline,
    final String? gender,
  }) : super(
          name: name,
          email: email,
          password: password,
          uid: uid,
          status: status,
          profileUrl: profileUrl,
          phoneNumber: phoneNumber,
          isOnline: isOnline,
          gender: gender,
        );

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      name: snapshot.get("name"),
      email: snapshot.get("email"),
      password: snapshot.get("password"),
      uid: snapshot.get("uid"),
      status: snapshot.get("status"),
      profileUrl: snapshot.get("profileUrl"),
      phoneNumber: snapshot.get("phoneNumber"),
      isOnline: snapshot.get("isOnline"),
      gender: snapshot.get("gender"),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "name": name,
      "email": email,
      //"password": password,
      "uid": uid,
      "status": status,
      "profileUrl": profileUrl,
      "phoneNumber": phoneNumber,
      "isOnline": isOnline,
      "gender": gender,
    };
  }
}
