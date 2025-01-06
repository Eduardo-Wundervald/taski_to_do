import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:taski_to_do/core/router/app_router.dart';
import 'package:taski_to_do/src/data/model/task.dart';

import 'src/presentation/viewmodel/bottom_bar_view_model.dart';
import 'src/presentation/viewmodel/create_task_view_model.dart';
import 'src/presentation/viewmodel/todo_task_view_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  final taskBox = await Hive.openBox<Task>('taskBox');

  runApp(MyApp(taskBox: taskBox));
}

class MyApp extends StatelessWidget {
  final Box<Task> taskBox;
  const MyApp({super.key, required this.taskBox});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomBarViewModel()),
        ChangeNotifierProvider(
            create: (_) => TodoTaskViewModel(taskBox: taskBox)),
        ChangeNotifierProvider(
            create: (_) => CreateTaskViewModel(taskBox: taskBox)),
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
