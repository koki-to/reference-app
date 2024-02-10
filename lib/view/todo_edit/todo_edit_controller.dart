import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../repository/todo_repository.dart';
import '../todo_list/todo_list_state.dart';

final todoEditControllerProvider =
    StateNotifierProvider.autoDispose<TodoEditController, TodoListState>(
  (ref) => TodoEditController(
    todoRepository: ref.read(todoRepositoryProvider),
  ),
);

class TodoEditController extends StateNotifier<TodoListState> {
  TodoEditController({required this.todoRepository})
      : super(const TodoListState()) {
    _initialize();
  }

  final TodoRepository todoRepository;

  Future<void> _initialize() async {
    final todoList = await todoRepository.fetchTodoList();
    state = state.copyWith(todolist: todoList);
  }
}
