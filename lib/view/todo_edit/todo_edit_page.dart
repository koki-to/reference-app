import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widgets/alert_dialog.dart';
import '../../common_widgets/basic_form_field.dart';
import '../../config/providers.dart';
import '../../config/router.gr.dart';
import '../../model/entity/page_state.dart';
import '../../model/entity/todo.dart';
import '../../utils/validator.dart';
import 'todo_edit_controller.dart';

enum TodoMode {
  edit,
  create,
}

@RoutePage()
class TodoEditPage extends ConsumerWidget {
  const TodoEditPage({
    required this.todo,
    required this.mode,
    super.key,
  });

  final Todo todo;
  final TodoMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(todoEditControllerProvider(todo).notifier);
    final formKey = ref.watch(todoEditFormKeyProvider);
    final pageState = ref.watch(
      todoEditControllerProvider(todo).select((value) => value.pageState),
    );
    return Stack(
      children: [
        Form(
          key: formKey,
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                '新規登録',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.blueAccent,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: BasicFormField(
                      onChanged: (value) =>
                          controller.updateTitleAndDescription(title: value),
                      validator: v.requiredString,
                      hintText: 'タイトル',
                      initialValue: todo.title,
                    ),
                  ),
                  const SizedBox(height: 60),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: BasicFormField(
                      onChanged: (value) =>
                          controller.updateTitleAndDescription(
                        description: value,
                      ),
                      validator: v.requiredString,
                      hintText: '説明文',
                      initialValue: todo.discription,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        switch (mode) {
                          case TodoMode.create:
                            controller.createTodo().then(
                                  (value) => value
                                      ? context.router
                                          .replace(const TodoListRoute())
                                      : null,
                                );
                          case TodoMode.edit:
                            controller.editTodo().then(
                                  (value) => value
                                      ? context.router
                                          .replace(const TodoListRoute())
                                      : null,
                                );
                        }
                      }
                    },
                    child: Text(pageState is PageStateLoading ? '登録中' : '登録'),
                  ),
                ],
              ),
            ),
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
