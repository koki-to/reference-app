import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repository/auth_repository.dart';
import 'sign_up_state.dart';

final signUpControllerProvider = Provider(
  (ref) => SignUpController(
    authRepository: ref.watch(
      authRepositoryProvider,
    ),
  ),
);

class SignUpController extends StateNotifier<SignUpState> {
  SignUpController({required this.authRepository})
      : super(const SignUpState()) {
    _initialize();
  }

  final AuthRepository authRepository;

  Future<void> _initialize() async {}

  void updateEmailAndPassword({String? email, String? password}) {
    state = state.copyWith(
      email: email ?? state.email,
      password: password ?? state.password,
    );
  }

  Future<void> signUp() async {
    await authRepository.createUser(
      email: state.email,
      password: state.password,
    );
  }
}
