import 'package:flutter/material.dart';
import 'package:taski_to_do/core/widgets/create_task.dart';

import '../view/task/done_task_view.dart';
import '../view/task/search_task_view.dart';
import '../view/task/todo_task_view.dart';

class BottomBarViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final List<Widget> screens = [
    const TodoTask(),
    CreateTask(),
    SearchTask(),
    const DoneTask(),
  ];

  Widget get currentScreen => screens[_currentIndex];

  void onTabChange(BuildContext context, int index) {
    if (index == 1) {
      showModalBottomSheet(
        context: context,
        barrierColor: Colors.black.withOpacity(0.5),
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        builder: (BuildContext context) {
          return CreateTask();
        },
      );
    } else {
      _currentIndex = index;
      notifyListeners();
    }
  }
}
