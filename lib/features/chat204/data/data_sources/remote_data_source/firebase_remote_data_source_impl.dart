import 'package:chat204/features/chat204/data/data_sources/remote_data_source/firebase_remote_data_source.dart';
import 'package:chat204/features/chat204/data/data_sources/remote_data_source/models/user_model.dart';
import 'package:chat204/features/chat204/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final GoogleSignIn googleSignIn;

  FirebaseRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.firebaseFirestore,
    required this.googleSignIn,
  });
  @override
  Future<void> forgetPassword(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async {
    final userCollection = firebaseFirestore.collection("users");
    final uid = await getCurrentUserId();
    userCollection.doc(uid).get().then((userDocument) {
      final newUser = UserModel(
        name: user.name,
        email: user.email,
        password: user.password,
        uid: uid,
        status: user.status,
        profileUrl: user.profileUrl,
        phoneNumber: user.phoneNumber,
        gender: user.gender,
        isOnline: user.isOnline,
      ).toDocument();

      if (!userDocument.exists) {
        userCollection.doc(uid).set(newUser);
      }
      return;
    });
  }

  @override
  Future<String> getCurrentUserId() async =>
      firebaseAuth.currentUser?.uid ?? "";

  @override
  Future<void> getUpdateUser(UserEntity user) {
    throw UnimplementedError();
  }

  @override
  Future<void> googleAuth() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    final userCredential =
        (await firebaseAuth.signInWithCredential(oAuthCredential)).user;

    getCreateCurrentUser(UserEntity(
        name: userCredential!.displayName,
        email: userCredential.email,
        password: "",
        status: "",
        profileUrl: userCredential.photoURL,
        phoneNumber: userCredential.phoneNumber,
        isOnline: "",
        gender: ""));
  }

  @override
  Future<bool> isSignIn() async => firebaseAuth.currentUser?.uid != null;

  @override
  Future<void> signIn(UserEntity user) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: user.email!,
      password: user.password!,
    );
  }

  @override
  Future<void> signOut() async => await firebaseAuth.signOut();

  @override
  Future<void> signUp(UserEntity user) async {
    await firebaseAuth.createUserWithEmailAndPassword(
      email: user.email!,
      password: user.password!,
    );
  }
}
