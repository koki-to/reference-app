import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/entity/page_state.dart';
import '../../model/entity/result.dart';
import '../../repository/auth_repository.dart';
import '../../utils/exception/app_exception.dart';
import 'login_state.dart';

final loginControllerProvider =
    StateNotifierProvider.autoDispose<LoginController, LoginState>(
  (ref) => LoginController(
    authRepository: ref.read(authRepositoryProvider),
  ),
);

class LoginController extends StateNotifier<LoginState> {
  LoginController({required this.authRepository}) : super(const LoginState()) {
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

  void updatePageState({required PageState pageState}) {
    state = state.copyWith(pageState: pageState);
  }

  Future<bool> login() async {
    updatePageState(pageState: const PageState.loading());
    final res = await authRepository.login(
      email: state.email,
      password: state.password,
    );
    switch (res) {
      case Success():
        updatePageState(pageState: const PageState.none());
        return true;
      case Failure<bool, Exception>(exception: final value):
        updatePageState(
          pageState: PageState.dialog(
            'エラー',
            (value as AppException).message,
          ),
        );
        return false;
    }
  }
}
