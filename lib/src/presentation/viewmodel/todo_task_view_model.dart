import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

import '../../data/model/task.dart';

class TodoTaskViewModel extends ChangeNotifier {
  final Box<Task> taskBox;

  TodoTaskViewModel({required this.taskBox});

  // get uncompleted tasks
  Map<int, Task> get uncompletedTasks {
    return Map<int, Task>.fromEntries(
      taskBox.toMap().entries.where((entry) => !entry.value.isDone).map(
            (entry) => MapEntry(entry.key as int, entry.value),
          ),
    );
  }

  // number of tasks uncompleted
  int get uncompletedTasksCount => uncompletedTasks.length;

  // set task as done
  void toggleTaskDone(int key) {
    final task = taskBox.get(key);
    if (task != null) {
      final updatedTask = Task(
        title: task.title,
        description: task.description,
        isDone: !task.isDone,
      );
      taskBox.put(key, updatedTask);
      notifyListeners();
    }
  }

  void notifyTasksUpdated() {
    notifyListeners();
  }
}
