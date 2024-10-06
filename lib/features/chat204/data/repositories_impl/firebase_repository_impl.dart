import 'package:chat204/features/chat204/data/data_sources/remote_data_source/firebase_remote_data_source.dart';
import 'package:chat204/features/chat204/domain/entities/user_entity.dart';
import 'package:chat204/features/chat204/domain/repositories/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseRemoteDataSource firebaseRemoteDataSource;

  FirebaseRepositoryImpl({required this.firebaseRemoteDataSource});

  @override
  Future<void> forgetPassword(String email) async =>
      firebaseRemoteDataSource.forgetPassword(email);

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async =>
      firebaseRemoteDataSource.getCreateCurrentUser(user);

  @override
  Future<String> getCurrentUserId() async =>
      firebaseRemoteDataSource.getCurrentUserId();

  @override
  Future<void> getUpdateUser(UserEntity user) async =>
      firebaseRemoteDataSource.getUpdateUser(user);

  @override
  Future<void> googleAuth() async => firebaseRemoteDataSource.googleAuth();

  @override
  Future<bool> isSignIn() async => firebaseRemoteDataSource.isSignIn();

  @override
  Future<void> signIn(UserEntity user) async =>
      firebaseRemoteDataSource.signIn(user);

  @override
  Future<void> signOut() async => firebaseRemoteDataSource.signOut();

  @override
  Future<void> signUp(UserEntity user) async =>
      firebaseRemoteDataSource.signUp(user);
}
