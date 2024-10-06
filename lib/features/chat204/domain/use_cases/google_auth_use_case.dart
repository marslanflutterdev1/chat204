import 'package:chat204/features/chat204/domain/repositories/firebase_repository.dart';

class GoogleAuthUseCase {
  final FirebaseRepository firebaseRepository;
  GoogleAuthUseCase({required this.firebaseRepository});

  Future<void> googleAuth() {
    return firebaseRepository.googleAuth();
  }
}
