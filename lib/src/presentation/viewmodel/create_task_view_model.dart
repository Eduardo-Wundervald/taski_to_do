import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:taski_to_do/src/data/model/task.dart';
import 'package:taski_to_do/src/presentation/viewmodel/todo_task_view_model.dart';

class CreateTaskViewModel extends ChangeNotifier {
  final Box<Task> taskBox;

  CreateTaskViewModel({required this.taskBox});

  // add task
  void createTask(String title, String description,
      [TodoTaskViewModel? todoTaskViewModel]) {
    if (title.isEmpty) {
      return;
    }

    final task = Task(
      title: title,
      description: description,
      isDone: false,
    );

    taskBox.add(task);

    todoTaskViewModel?.notifyTasksUpdated();

    notifyListeners();
  }
}
