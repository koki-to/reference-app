import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widgets/todo_card.dart';
import '../../model/entity/todo.dart';
import '../todo_edit/todo_edit_page.dart';
import 'todo_list_controller.dart';

class TodoListPage extends ConsumerWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(todoListControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'todoリスト',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: state.todolist.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: state.todolist.length,
              itemBuilder: (BuildContext context, int index) {
                return TodoCard(
                  todo: state.todolist.first,
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute<TodoEditPage>(
              builder: (_) => TodoEditPage(
                todo: Todo.empty(),
              ),
            ),
          );
        },
      ),
    );
  }
}
