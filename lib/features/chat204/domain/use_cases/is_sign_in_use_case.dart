import 'package:chat204/features/chat204/domain/repositories/firebase_repository.dart';

class IsSignInUseCase {
  final FirebaseRepository firebaseRepository;
  IsSignInUseCase({required this.firebaseRepository});

  Future<bool> isSignIn() {
    return firebaseRepository.isSignIn();
  }
}
