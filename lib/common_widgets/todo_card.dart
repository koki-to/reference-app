import 'package:flutter/material.dart';

import '../model/entity/todo.dart';
import '../view/todo_edit/todo_edit_page.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    required this.todo,
    super.key,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<TodoEditPage>(
            builder: (_) => TodoEditPage(todo: todo),
          ),
        );
      },
      child: Card(
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.check_box_outline_blank_rounded),
              onPressed: () {},
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(todo.title),
                Text(todo.discription),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
