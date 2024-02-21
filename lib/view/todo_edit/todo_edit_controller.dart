import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../model/entity/page_state.dart';
import '../../model/entity/result.dart';
import '../../model/entity/todo.dart';
import '../../repository/auth_repository.dart';
import '../../repository/todo_repository.dart';
import '../../utils/exception/app_exception.dart';
import 'todo_edit_state.dart';

final todoEditControllerProvider = StateNotifierProvider.autoDispose
    .family<TodoEditController, TodoEditState, Todo>(
  (ref, todo) => TodoEditController(
    todo: todo,
    todoRepository: ref.read(todoRepositoryProvider),
    authRepository: ref.read(authRepositoryProvider),
  ),
);

class TodoEditController extends StateNotifier<TodoEditState> {
  TodoEditController({
    required this.todo,
    required this.todoRepository,
    required this.authRepository,
  }) : super(const TodoEditState()) {
    _initialize();
  }

  final Todo todo;
  final TodoRepository todoRepository;
  final AuthRepository authRepository;

  Future<void> _initialize() async {
    await _fetchUser();
    updateTitleAndDescription(
      title: todo.title,
      description: todo.discription,
    );
  }

  Future<void> _fetchUser() async {
    final user = authRepository.currentUser;
    if (user == null) {
      state = state.copyWith(
        pageState: const PageStateDialog('エラー', 'セッションが切れました再度ログインしてください'),
      );
    } else {
      state = state.copyWith(user: user);
    }
  }

  void updateTitleAndDescription({String? title, String? description}) {
    state = state.copyWith(
      title: title ?? state.title,
      description: description ?? state.description,
    );
  }

  void updatePageState({required PageState pageState}) {
    state = state.copyWith(pageState: pageState);
  }

  Future<bool> createTodo() async {
    updatePageState(pageState: const PageState.loading());
    final res = await todoRepository.createTodo(
      todo: Todo(
        id: const Uuid().v4(),
        title: state.title,
        discription: state.description,
        completed: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      uid: state.user!.uid,
    );
    switch (res) {
      case Success<bool, Exception>():
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

  Future<bool> editTodo() async {
    updatePageState(pageState: const PageState.loading());
    final res = await todoRepository.editTodo(
      todo: Todo(
        id: todo.id,
        title: state.title,
        discription: state.description,
        completed: todo.completed,
        createdAt: todo.createdAt,
        updatedAt: DateTime.now(),
      ),
      uid: state.user!.uid,
    );
    switch (res) {
      case Success<bool, Exception>():
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
