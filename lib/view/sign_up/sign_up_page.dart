import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'sign_up_controller.dart';

@RoutePage()
class SignupPage extends ConsumerWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(signUpControllerProvider);
    final emialController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('新規登録'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                controller: emialController,
                onChanged: (value) => controller.updateEmailAndPassword(
                  email: value,
                ),
                decoration: const InputDecoration(
                  hintText: 'メールアドレス',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                controller: passwordController,
                onChanged: (value) => controller.updateEmailAndPassword(
                  password: value,
                ),
                decoration: const InputDecoration(
                  hintText: 'パスワード',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: controller.signUp,
              child: const Text('登録する'),
            ),
          ],
        ),
      ),
    );
  }
}
