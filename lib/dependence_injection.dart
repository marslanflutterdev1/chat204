import 'package:chat204/features/chat204/data/data_sources/remote_data_source/firebase_remote_data_source.dart';
import 'package:chat204/features/chat204/data/data_sources/remote_data_source/firebase_remote_data_source_impl.dart';
import 'package:chat204/features/chat204/data/repositories_impl/firebase_repository_impl.dart';
import 'package:chat204/features/chat204/domain/repositories/firebase_repository.dart';
import 'package:chat204/features/chat204/domain/use_cases/forget_password_use_case.dart';
import 'package:chat204/features/chat204/domain/use_cases/get_create_current_user_use_case.dart';
import 'package:chat204/features/chat204/domain/use_cases/get_current_user_id_use_case.dart';
import 'package:chat204/features/chat204/domain/use_cases/google_auth_use_case.dart';
import 'package:chat204/features/chat204/domain/use_cases/is_sign_in_use_case.dart';
import 'package:chat204/features/chat204/domain/use_cases/sign_in_use_case.dart';
import 'package:chat204/features/chat204/domain/use_cases/sign_out_use_case.dart';
import 'package:chat204/features/chat204/domain/use_cases/sign_up_use_case.dart';
import 'package:chat204/features/chat204/presentation/blocs/cubit/authentication/auth/auth_cubit/auth_cubit.dart';
import 'package:chat204/features/chat204/presentation/blocs/cubit/authentication/credential/credential_cubit/credential_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final sl = GetIt.instance; // sl stands for services locator.
Future<void> init() async {
  // Bloc Registration.
  sl.registerFactory<AuthCubit>(
    () => AuthCubit(
      /*
      isSignInUseCase: isSignInUseCase,
      isSignInUseCase replace with sl.call() becase  dependence injection GetIt handle all these things as this class where exist on route and other all requirement,
      Same procedure use in all other below use-case and other class and if later time we add new any things then use same procedure.


      1. sl.call() manage all work for us and it manage which dependence pass and which not and when it need or not and where pass it or not.
      2. In just concise talking that sl.call() of GetIt dependence handle all these things for us.
      */
      isSignInUseCase: sl.call(),
      //getCurrentUserIdUseCase: getCurrentUserIdUseCase, // replace by sl.call();
      getCurrentUserIdUseCase: sl.call(),
      signOutUseCase: sl.call(),
    ),
  );

  sl.registerFactory<CredentialCubit>(
    // This one <CredentialCubit> is Generic-Type or itself-interface & same in other all.
    () => CredentialCubit(
      //signInUseCase: signInUseCase,
      signInUseCase: sl.call(),
      signUpUseCase: sl.call(),
      forgetPasswordUseCase: sl.call(),
      getCreateCurrentUserUseCase: sl.call(),
      googleAuthUseCase: sl.call(),
    ),
  );

  // UseCase Registration.

  // AuthCubit use-case register.
  sl.registerLazySingleton<IsSignInUseCase>(
    () => IsSignInUseCase(
      firebaseRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<GetCurrentUserIdUseCase>(
      () => GetCurrentUserIdUseCase(
            firebaseRepository: sl.call(),
          ));
  sl.registerLazySingleton<SignOutUseCase>(() => SignOutUseCase(
        firebaseRepository: sl.call(),
      ));

  // Credential use-case register.
  sl.registerLazySingleton<SignInUseCase>(
    () => SignInUseCase(
      firebaseRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(
      firebaseRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<ForgetPasswordUseCase>(
    () => ForgetPasswordUseCase(
      firebaseRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<GetCreateCurrentUserUseCase>(
    () => GetCreateCurrentUserUseCase(
      firebaseRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton<GoogleAuthUseCase>(
    () => GoogleAuthUseCase(
      firebaseRepository: sl.call(),
    ),
  );

  // Repository Registeration.

  sl.registerLazySingleton<FirebaseRepository>(() => FirebaseRepositoryImpl(
        firebaseRemoteDataSource: sl.call(),
      ));

  // Remote DataSource Registeration.
  sl.registerLazySingleton<FirebaseRemoteDataSource>(
    () => FirebaseRemoteDataSourceImpl(
      firebaseAuth: sl.call(),
      firebaseFirestore: sl.call(),
      googleSignIn: sl.call(),
    ),
  );

  // External.
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;
  final googleSignIn = GoogleSignIn();

  sl.registerLazySingleton(() => firebaseAuth);
  sl.registerLazySingleton(() => firebaseFirestore);
  sl.registerLazySingleton(() => googleSignIn);
}
