import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widgets/alert_dialog.dart';
import '../../common_widgets/todo_card.dart';
import '../../config/router.gr.dart';
import '../../model/entity/page_state.dart';
import '../../model/entity/todo.dart';
import '../todo_edit/todo_edit_page.dart';
import 'todo_list_controller.dart';

@RoutePage()
class TodoListPage extends ConsumerWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(todoListControllerProvider.notifier);
    final state = ref.watch(todoListControllerProvider);
    final pageState = ref
        .watch(todoListControllerProvider.select((state) => state.pageState));
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text(
              'todoリスト',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blueAccent,
          ),
          body: state.todoList.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: state.todoList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TodoCard(
                      todo: state.todoList[index],
                    );
                  },
                ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              context.router.push(
                TodoEditRoute(
                  todo: Todo.empty(),
                  mode: TodoMode.create,
                ),
              );
            },
          ),
        ),
        if (pageState is PageStateLoading)
          const Positioned.fill(
            child: ColoredBox(
              color: Colors.black38,
              child: Center(child: CircularProgressIndicator()),
            ),
          ),
        if (pageState is PageStateDialog)
          Positioned.fill(
            child: ColoredBox(
              color: Colors.black38,
              child: CostomAlertDialog(
                onTap: () => controller.updatePageState(
                  pageState: const PageState.none(),
                ),
                title: pageState.title!,
                description: pageState.description!,
              ),
            ),
          ),
      ],
    );
  }
}
