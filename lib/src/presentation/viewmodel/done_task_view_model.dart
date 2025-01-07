import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import '../../data/model/task.dart';

class DoneTaskViewModel extends ChangeNotifier {
  final Box<Task> taskBox;

  DoneTaskViewModel({required this.taskBox});

  // Lista de tarefas concluídas
  Map<int, Task> get completedTasks {
    return Map<int, Task>.fromEntries(
      taskBox.toMap().entries.where((entry) => entry.value.isDone).map(
            (entry) => MapEntry(entry.key as int, entry.value),
          ),
    );
  }

  // Número de tarefas concluídas
  int get completedTasksCount => completedTasks.length;

  // Alternar status de conclusão
  void toggleTaskUndone(int key) {
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

  // Deletar todas as tarefas concluídas
  void deleteAllTasksDone() {
    if (completedTasks.isEmpty) return;
    taskBox.deleteAll(completedTasks.keys);
    notifyListeners();
  }

  // Deletar tarefa específica
  void deleteTask(int key) {
    taskBox.delete(key);
    notifyListeners();
  }
}
