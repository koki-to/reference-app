// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i7;
import 'package:reference_app/model/entity/todo.dart' as _i6;
import 'package:reference_app/view/login/login_page.dart' as _i1;
import 'package:reference_app/view/sign_up/sign_up_page.dart' as _i2;
import 'package:reference_app/view/todo_edit/todo_edit_page.dart' as _i3;
import 'package:reference_app/view/todo_list/todo_list_page.dart' as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    SignupRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SignupPage(),
      );
    },
    TodoEditRoute.name: (routeData) {
      final args = routeData.argsAs<TodoEditRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.TodoEditPage(
          todo: args.todo,
          mode: args.mode,
          key: args.key,
        ),
      );
    },
    TodoListRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.TodoListPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute({List<_i5.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SignupPage]
class SignupRoute extends _i5.PageRouteInfo<void> {
  const SignupRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.TodoEditPage]
class TodoEditRoute extends _i5.PageRouteInfo<TodoEditRouteArgs> {
  TodoEditRoute({
    required _i6.Todo todo,
    required _i3.TodoMode mode,
    _i7.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          TodoEditRoute.name,
          args: TodoEditRouteArgs(
            todo: todo,
            mode: mode,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'TodoEditRoute';

  static const _i5.PageInfo<TodoEditRouteArgs> page =
      _i5.PageInfo<TodoEditRouteArgs>(name);
}

class TodoEditRouteArgs {
  const TodoEditRouteArgs({
    required this.todo,
    required this.mode,
    this.key,
  });

  final _i6.Todo todo;

  final _i3.TodoMode mode;

  final _i7.Key? key;

  @override
  String toString() {
    return 'TodoEditRouteArgs{todo: $todo, mode: $mode, key: $key}';
  }
}

/// generated route for
/// [_i4.TodoListPage]
class TodoListRoute extends _i5.PageRouteInfo<void> {
  const TodoListRoute({List<_i5.PageRouteInfo>? children})
      : super(
          TodoListRoute.name,
          initialChildren: children,
        );

  static const String name = 'TodoListRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
