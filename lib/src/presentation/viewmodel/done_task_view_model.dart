import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../data/model/task.dart';

class DoneTaskViewModel extends ChangeNotifier {
  final Box<Task> taskBox;

  DoneTaskViewModel({required this.taskBox});

  // Lista de tarefas concluídas
  List<Task> get completedTasks =>
      taskBox.values.where((task) => task.isDone).toList();

  // Número de tarefas concluídas
  int get completedTaskCount => completedTasks.length;

  // Alternar status de conclusão
  void toggleTaskDone(int index) {
    final task = taskBox.getAt(index);
    if (task != null) {
      task.isDone = !task.isDone;
      task.save();
      notifyListeners();
    }
  }

  //delete all done
  void deleteAllTaskDone() {
    if (completedTaskCount == 0) return;
    taskBox.deleteAll(
        taskBox.keys.where((key) => taskBox.get(key)!.isDone).toList());
    notifyListeners();
  }

  //delete task
  void deleteTask(int index) {
    taskBox.deleteAt(index);
    notifyListeners();
  }
}
