import 'package:go_router/go_router.dart';

import '../../src/presentation/view/home_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) {
          return const HomeView();
        },
      )
    ],
  );
}
