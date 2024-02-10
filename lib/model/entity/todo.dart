import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    required String id,
    required String title,
    required String discription,
    required bool completed,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Todo;

  factory Todo.empty() => Todo(
        id: '',
        title: '',
        discription: '',
        completed: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
