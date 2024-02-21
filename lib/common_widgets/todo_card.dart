import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../config/router.gr.dart';
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
        context.router.push(
          TodoEditRoute(
            todo: todo,
            mode: TodoMode.edit,
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
