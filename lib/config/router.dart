import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: TodoListRoute.page, initial: true),
        AutoRoute(page: TodoEditRoute.page),
        AutoRoute(page: SignupRoute.page),
      ];
}
