import 'package:chat204/features/chat204/domain/entities/user_entity.dart';
import 'package:chat204/features/chat204/domain/repositories/firebase_repository.dart';

class SignInUseCase {
  final FirebaseRepository firebaseRepository;
  SignInUseCase({required this.firebaseRepository});

  Future<void> signIn(UserEntity user) {
    return firebaseRepository.signIn(user);
  }
}
