import 'package:chat204/features/chat204/domain/entities/user_entity.dart';
import 'package:chat204/features/chat204/domain/repositories/firebase_repository.dart';

class GetCreateCurrentUserUseCase {
  final FirebaseRepository firebaseRepository;
  GetCreateCurrentUserUseCase({required this.firebaseRepository});

  Future<void> getCreateCurrentUser(UserEntity user) {
    return firebaseRepository.getCreateCurrentUser(user);
  }
}
