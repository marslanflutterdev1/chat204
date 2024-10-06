import 'package:chat204/features/chat204/domain/repositories/firebase_repository.dart';

class ForgetPasswordUseCase {
  final FirebaseRepository firebaseRepository;
  ForgetPasswordUseCase({required this.firebaseRepository});

  Future<void> forgetPassword(String email) {
    return firebaseRepository.forgetPassword(email);
  }
}
