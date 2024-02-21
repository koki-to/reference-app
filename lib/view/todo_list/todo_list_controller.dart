import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/entity/page_state.dart';
import '../../model/entity/result.dart';
import '../../model/entity/todo.dart';
import '../../repository/auth_repository.dart';
import '../../repository/todo_repository.dart';
import '../../utils/exception/app_exception.dart';
import 'todo_list_state.dart';

final todoListControllerProvider =
    StateNotifierProvider.autoDispose<TodoListController, TodoListState>(
  (ref) => TodoListController(
    todoRepository: ref.read(todoRepositoryProvider),
    authRepository: ref.read(authRepositoryProvider),
  ),
);

class TodoListController extends StateNotifier<TodoListState> {
  TodoListController({
    required this.todoRepository,
    required this.authRepository,
  }) : super(const TodoListState()) {
    _initialize();
  }

  final TodoRepository todoRepository;
  final AuthRepository authRepository;

  void updatePageState({required PageState pageState}) {
    state = state.copyWith(pageState: pageState);
  }

  Future<void> _initialize() async {
    updatePageState(pageState: const PageState.loading());
    final userId = authRepository.currentUser;
    final res = await todoRepository.fetchTodoList(uid: userId!.uid);
    switch (res) {
      case Success(value: final todoList):
        state = state.copyWith(todoList: todoList);
        updatePageState(pageState: const PageState.none());

      case Failure<List<Todo>, Exception>(exception: final e):
        updatePageState(
          pageState: PageState.dialog(
            'エラー',
            (e as AppException).message,
          ),
        );
    }
  }
}
