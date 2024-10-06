import 'package:chat204/features/chat204/domain/repositories/firebase_repository.dart';

class GetCurrentUserIdUseCase {
  final FirebaseRepository firebaseRepository;
  GetCurrentUserIdUseCase({required this.firebaseRepository});

  Future<String> getCurrentUserId() {
    return firebaseRepository.getCurrentUserId();
  }
}
