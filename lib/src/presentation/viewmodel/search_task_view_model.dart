import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../data/model/task.dart';

class SearchTaskViewModel extends ChangeNotifier {
  final Box<Task> taskBox;

  SearchTaskViewModel({required this.taskBox});

  List<Task> _filteredTasks = [];
  List<Task> get filteredTasks => _filteredTasks;

  String _currentQuery = '';

  //search task
  void searchTask(String query) {
    _currentQuery = query;
    if (query.isEmpty) {
      _filteredTasks = [];
    } else {
      _filteredTasks = taskBox.values
          .where((task) =>
              task.title.toLowerCase().contains(query.toLowerCase()) ||
              task.description.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  //change state of task
  void changeTaskState(Task task) {
    task.isDone = !task.isDone;
    task.save();
    notifyListeners();
  }

  //delete task
  void deleteTask(int key) {
    taskBox.delete(key);
    if (_currentQuery.isNotEmpty) {
      _filteredTasks = taskBox.values
          .where((task) =>
              task.title.toLowerCase().contains(_currentQuery.toLowerCase()) ||
              task.description
                  .toLowerCase()
                  .contains(_currentQuery.toLowerCase()))
          .toList();
    } else {
      _filteredTasks = [];
    }

    notifyListeners();
  }
}
