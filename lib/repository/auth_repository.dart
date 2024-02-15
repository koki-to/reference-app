import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/providers.dart';
import '../model/entity/result.dart';
import '../utils/exception/app_exception.dart';
import '../utils/firebase_auth_error_convert.dart';

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(auth: ref.watch(firebaseAuthProvider)),
);

abstract class AuthRepository {
  Future<UserCredential> createUser({
    required String email,
    required String password,
  });
  Future<Result<bool, Exception>> login({
    required String email,
    required String password,
  });
  User? get currentUser;
}

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({required this.auth});
  final FirebaseAuth auth;
  @override
  Future<UserCredential> createUser({
    required String email,
    required String password,
  }) {
    try {
      return auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Result<bool, Exception>> login({
    required String email,
    required String password,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return const Success(true);
    } on FirebaseAuthException catch (e) {
      final exception =
          AppException(code: e.code, message: convertErrorMesseage(e));
      return Failure(exception);
    }
  }

  @override
  // TODO: implement currentUser
  User? get currentUser => auth.currentUser;
}
