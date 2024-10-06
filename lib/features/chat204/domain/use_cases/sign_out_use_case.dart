import 'package:chat204/features/chat204/domain/repositories/firebase_repository.dart';

class SignOutUseCase {
  final FirebaseRepository firebaseRepository;
  SignOutUseCase({required this.firebaseRepository});

  Future<void> signOut() async {
    return await firebaseRepository.signOut();
  }
}
