import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/providers.dart';
import '../model/entity/result.dart';
import '../model/entity/todo.dart';
import '../utils/exception/app_exception.dart';

final todoRepositoryProvider = Provider<TodoRepository>(
  (ref) => TodoRepositoryImpl(
    firestore: ref.watch(firestoreProvider),
  ),
);

abstract class TodoRepository {
  Future<Result<bool, Exception>> createTodo({
    required Todo todo,
    required String uid,
  });
  Future<Result<bool, Exception>> editTodo({
    required Todo todo,
    required String uid,
  });
  Future<Result<List<Todo>, Exception>> fetchTodoList({required String uid});
}

class TodoRepositoryImpl implements TodoRepository {
  const TodoRepositoryImpl({required this.firestore});
  final FirebaseFirestore firestore;
  @override
  Future<Result<bool, Exception>> createTodo({
    required Todo todo,
    required String uid,
  }) async {
    try {
      await firestore
          .collection('users')
          .doc(uid)
          .collection('todo')
          .doc(todo.id)
          .set(todo.toJson());

      return const Success(true);
    } on FirebaseException catch (e) {
      final exception = AppException(code: e.code, message: '作成に失敗しました');
      return Failure(exception);
    }
  }

  @override
  Future<Result<List<Todo>, Exception>> fetchTodoList({
    required String uid,
  }) async {
    try {
      final snapshot =
          await firestore.collection('users').doc(uid).collection('todo').get();
      final todoList =
          snapshot.docs.map((e) => Todo.fromJson(e.data())).toList();
      return Success(todoList);
    } on FirebaseException catch (e) {
      final exception = AppException(code: e.code, message: '作成に失敗しました');
      return Failure(exception);
    }
  }

  @override
  Future<Result<bool, Exception>> editTodo({
    required Todo todo,
    required String uid,
  }) async {
    try {
      await firestore
          .collection('users')
          .doc(uid)
          .collection('todo')
          .doc(todo.id)
          .update(todo.toJson());
      return const Success(true);
    } on FirebaseException catch (e) {
      final exception = AppException(code: e.code, message: '更新に失敗しました');
      return Failure(exception);
    }
  }
}
