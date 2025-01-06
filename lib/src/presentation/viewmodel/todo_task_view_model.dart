import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

import '../../data/model/task.dart';

class TodoTaskViewModel extends ChangeNotifier {
  final Box<Task> taskBox;

  TodoTaskViewModel({required this.taskBox});

  // get tasks
  List<Task> get task => taskBox.values.toList();

  // number of tasks
  int get taskCount => taskBox.length;

  // set task as done
  void toogleTaskDone(int index) {
    final task = taskBox.getAt(index);
    if (task != null) {
      task.isDone = !task.isDone;
      task.save();
      notifyListeners();
    }
    notifyListeners();
  }

  void notifyTasksUpdated() {
    notifyListeners();
  }
}
