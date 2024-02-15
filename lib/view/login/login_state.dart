import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/entity/page_state.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default('') String email,
    @Default('') String password,
    @Default(PageState.none()) PageState pageState,
  }) = _LoginState;

  const LoginState._();
}
