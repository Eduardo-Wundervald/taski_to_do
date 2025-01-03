import 'package:flutter/material.dart';
import 'package:taski_to_do/src/presentation/view/task/create_task_view.dart';

import '../view/task/delete_task_view.dart';
import '../view/task/search_task_view.dart';
import '../view/task/todo_task_view.dart';

class HomeViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final List<Widget> screens = [
    const TodoTask(),
    const CreateTask(),
    const SearchTask(),
    const DeleteTask(),
  ];

  Widget get currentScreen => screens[_currentIndex];

  void onTabChange(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
