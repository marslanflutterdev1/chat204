import 'package:chat204/features/chat204/domain/entities/user_entity.dart';
import 'package:chat204/features/chat204/domain/repositories/firebase_repository.dart';

class SignUpUseCase {
  final FirebaseRepository firebaseRepository;
  SignUpUseCase({required this.firebaseRepository});

  Future<void> signUp(UserEntity user) {
    return firebaseRepository.signUp(user);
  }
}
