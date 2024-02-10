import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_edit_state.freezed.dart';
part 'todo_edit_state.g.dart';

@freezed
class TodoEditState with _$TodoEditState {
  const factory TodoEditState({
    @Default('') String title,
    @Default('') String description,
  }) = _TodoEditState;

  factory TodoEditState.fromJson(Map<String, dynamic> json) =>
      _$TodoEditStateFromJson(json);
}
