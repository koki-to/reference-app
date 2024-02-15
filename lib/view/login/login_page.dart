import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widgets/alert_dialog.dart';
import '../../common_widgets/basic_form_field.dart';
import '../../config/providers.dart';
import '../../config/router.gr.dart';
import '../../model/entity/page_state.dart';
import '../../utils/validator.dart';
import 'login_controller.dart';

@RoutePage()
class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(formKeyProvider);
    final controller = ref.watch(loginControllerProvider.notifier);
    final pageState =
        ref.watch(loginControllerProvider.select((value) => value.pageState));
    return Stack(
      children: [
        Form(
          key: formKey,
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'ログイン画面',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.blueAccent,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: BasicFormField(
                      onChanged: (value) => controller.updateEmailAndPassword(
                        email: value,
                      ),
                      validator: v.email,
                      hintText: 'メールアドレス',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: BasicFormField(
                      onChanged: (value) => controller.updateEmailAndPassword(
                        password: value,
                      ),
                      validator: v.password,
                      hintText: 'パスワード',
                    ),
                  ),
                  const SizedBox(height: 60),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        controller.login().then(
                              (value) => value
                                  ? context.router
                                      .replace(const TodoListRoute())
                                  : null,
                            );
                      }
                    },
                    child: pageState is PageStateLoading
                        ? const Text('確認中')
                        : const Text('ログインする'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => context.router.push(const SignupRoute()),
                    child: const Text('新規登録'),
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
