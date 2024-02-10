import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/providers.dart';
import '../model/entity/todo.dart';

final todoRepositoryProvider = Provider<TodoRepository>(
  (ref) => TodoRepositoryImpl(
    firestore: ref.watch(firestoreProvider),
  ),
);

abstract class TodoRepository {
  Future<void> createTodo({required Todo todo});
  Future<List<Todo>> fetchTodoList();
}

class TodoRepositoryImpl implements TodoRepository {
  const TodoRepositoryImpl({required this.firestore});
  final FirebaseFirestore firestore;
  @override
  Future<void> createTodo({required Todo todo}) {
    // TODO: implement createTodo
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> fetchTodoList() async {
    return [
      Todo(
        id: '1',
        title: 'タイトル',
        discription: '説明',
        completed: false,
        createdAt: DateTime(2017, 9, 7, 17, 30),
        updatedAt: DateTime(2017, 9, 7, 17, 30),
      ),
    ];
  }
}
