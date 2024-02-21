import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/entity/page_state.dart';

part 'todo_edit_state.freezed.dart';

@freezed
class TodoEditState with _$TodoEditState {
  const factory TodoEditState({
    @Default('') String title,
    @Default('') String description,
    @Default(null) User? user,
    @Default(PageState.none()) PageState pageState,
  }) = _TodoEditState;
}
