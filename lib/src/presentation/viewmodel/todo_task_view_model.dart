import 'package:flutter/widgets.dart';

import '../../data/model/task.dart';

class TodoTaskViewModel extends ChangeNotifier {
  final List<Task> _tasks = [];

  // get tasks
  List<Task> get task => List.unmodifiable(_tasks);

  // number of tasks
  int get taskCount => _tasks.length;

  // set task as done
  void toogleTaskDone(int index) {
    _tasks[index] = Task(
      title: _tasks[index].title,
      description: _tasks[index].description,
      isDone: !_tasks[index].isDone,
    );
    notifyListeners();
  }
}
