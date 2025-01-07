import 'package:go_router/go_router.dart';
import 'package:taski_to_do/src/presentation/view/bottom_bar_view.dart';
import 'package:taski_to_do/core/widgets/create_task.dart';
import 'package:taski_to_do/src/presentation/view/task/done_task_view.dart';

import 'package:taski_to_do/src/presentation/view/task/todo_task_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) {
          return const BottomBar();
        },
      ),
      GoRoute(
        path: '/todo',
        builder: (context, state) {
          return const TodoTask();
        },
      ),
      GoRoute(
        path: '/create',
        builder: (context, state) {
          return CreateTask();
        },
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) {
          return const TodoTask();
        },
      ),
      GoRoute(
        path: '/delete',
        builder: (context, state) {
          return const DoneTask();
        },
      ),
    ],
  );
}
