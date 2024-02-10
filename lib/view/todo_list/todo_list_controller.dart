import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repository/todo_repository.dart';
import 'todo_list_state.dart';

final todoListControllerProvider =
    StateNotifierProvider.autoDispose<TodoListController, TodoListState>(
  (ref) => TodoListController(
    todoRepository: ref.read(todoRepositoryProvider),
  ),
);

class TodoListController extends StateNotifier<TodoListState> {
  TodoListController({required this.todoRepository})
      : super(const TodoListState()) {
    _initialize();
  }

  final TodoRepository todoRepository;

  Future<void> _initialize() async {
    final todoList = await todoRepository.fetchTodoList();
    state = state.copyWith(todolist: todoList);
  }
}
