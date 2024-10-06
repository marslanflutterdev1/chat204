import 'package:chat204/features/chat204/domain/entities/user_entity.dart';
import 'package:chat204/features/chat204/domain/repositories/firebase_repository.dart';

class GetUpdateUserUseCase {
  final FirebaseRepository firebaseRepository;
  GetUpdateUserUseCase({required this.firebaseRepository});

  Future<void> getUpdateUser(UserEntity user) {
    return firebaseRepository.getUpdateUser(user);
  }
}
