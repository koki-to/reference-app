import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/entity/page_state.dart';
import '../../model/entity/todo.dart';

part 'todo_list_state.freezed.dart';

@freezed
class TodoListState with _$TodoListState {
  const factory TodoListState({
    @Default([]) List<Todo> todoList,
    @Default(PageState.none()) PageState pageState,
  }) = _TodoListState;
}
