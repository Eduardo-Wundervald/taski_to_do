import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taski_to_do/core/router/app_router.dart';

import 'src/presentation/viewmodel/bottom_bar_view_model.dart';
import 'src/presentation/viewmodel/todo_task_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomBarViewModel()),
        ChangeNotifierProvider(create: (_) => TodoTaskViewModel()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1),
          checkboxTheme: CheckboxThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            visualDensity: VisualDensity.compact,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}
