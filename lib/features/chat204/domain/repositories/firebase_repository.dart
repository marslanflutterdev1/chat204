import 'package:chat204/features/chat204/domain/entities/user_entity.dart';

abstract class FirebaseRepository {
  Future<void> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<void> getCreateCurrentUser(UserEntity user);
  Future<bool> isSignIn();
  Future<void> signOut();
  Future<void> forgetPassword(String email);
  Future<void> googleAuth();
  Future<void> getUpdateUser(UserEntity user);
  Future<String> getCurrentUserId();
}
