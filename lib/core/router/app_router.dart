import 'package:go_router/go_router.dart';
import 'package:taski_to_do/src/presentation/view/task/create_task_view.dart';
import 'package:taski_to_do/src/presentation/view/task/delete_task_view.dart';
import 'package:taski_to_do/src/presentation/view/home_screen_view.dart';
import 'package:taski_to_do/src/presentation/view/task/todo_task_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) {
          return const HomeScreen();
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
          return const CreateTask();
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
          return const DeleteTask();
        },
      ),
    ],
  );
}
