import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.listen(loginControllerProvider, (_, state) async {
    //   if (state.isLoading) {
    //     ref.watch(overlayLoadingProvider.notifier).update((state) => true);
    //     return;
    //   }
    //   await state.when(
    //     data: (_) async {
    //       ref.watch(overlayLoadingProvider.notifier).update((state) => false);
    //       await context.router.replace(const HomeRoute());
    //     },
    //     error: (e, s) async {
    //       ref.watch(overlayLoadingProvider.notifier).update((state) => false);
    //       ref
    //           .read(scaffoldMessengerServiceProvider)
    //           .showSnackBar('エラーが発生しました。');
    //     },
    //     loading: () async {
    //       ref.watch(overlayLoadingProvider.notifier).update((state) => true);
    //     },
    //   );
    // });

    // final state = ref.watch(loginControllerProvider);
    final emialController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ログイン画面',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                controller: emialController,
                onChanged: (value) {},
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
                onChanged: (value) {},
                decoration: const InputDecoration(
                  hintText: 'パスワード',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 60),
            // ElevatedButton(
            //   onPressed: state.isLoading
            //       ? null
            //       : () async =>
            //           ref.read(loginControllerProvider.notifier).login(
            //                 email: emialController.text,
            //                 password: passwordController.text,
            //               ),
            //   child: const Text('ログインする'),
            // ),
            // const SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: state.isLoading
            //       ? null
            //       : () => context.router.push(const SignupRoute()),
            //   child: const Text('新規登録'),
            // ),
          ],
        ),
      ),
    );
  }
}
