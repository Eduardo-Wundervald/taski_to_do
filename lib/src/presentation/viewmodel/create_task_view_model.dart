import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:taski_to_do/src/data/model/task.dart';
import 'package:taski_to_do/src/presentation/viewmodel/todo_task_view_model.dart';

class CreateTaskViewModel extends ChangeNotifier {
  final Box<Task> taskBox;

  CreateTaskViewModel({required this.taskBox});

  // add task
  void createTask(String title, String description, BuildContext context) {
    if (title.isEmpty) {
      return;
    }

    final task = Task(
      title: title,
      description: description,
      isDone: false,
    );

    taskBox.add(task);

    Provider.of<TodoTaskViewModel>(context, listen: false).notifyTasksUpdated();

    notifyListeners();
  }
}
