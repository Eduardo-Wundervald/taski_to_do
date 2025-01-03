import 'package:flutter/material.dart';
import 'package:taski_to_do/src/presentation/view/task/create_task_view.dart';

import '../view/task/done_task_view.dart';
import '../view/task/search_task_view.dart';
import '../view/task/todo_task_view.dart';

class BottomBarViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final List<Widget> screens = [
    const TodoTask(),
    const CreateTask(),
    const SearchTask(),
    const DoneTask(),
  ];

  Widget get currentScreen => screens[_currentIndex];

  void onTabChange(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
