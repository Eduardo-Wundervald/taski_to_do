import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/hive_test.dart';
import 'package:taski_to_do/src/data/model/task.dart';
import 'package:taski_to_do/src/presentation/viewmodel/todo_task_view_model.dart';

void main() {
  group("TodoTaskViewModel Test", () {
    //set up the test
    late Box<Task> taskBox;
    late TodoTaskViewModel todoTaskViewModel;

    setUp(() async {
      //initialize hive test
      await setUpTestHive();
      if (!Hive.isAdapterRegistered(0)) {
        Hive.registerAdapter(TaskAdapter());
      }
      taskBox = await Hive.openBox<Task>("task");

      await taskBox.add(
          Task(title: "Task 1", description: "Description 1", isDone: false));
      await taskBox.add(
          Task(title: "Task 2", description: "Description 2", isDone: true));
      await taskBox.add(
          Task(title: "Task 3", description: "Description 3", isDone: false));

      todoTaskViewModel = TodoTaskViewModel(taskBox: taskBox);
    });

    //tear down the test
    tearDown(() async {
      await taskBox.clear();
      await taskBox.close();
      await tearDownTestHive();
    });

    test("should return only uncompleted tasks", () {
      final uncompletedTasks = todoTaskViewModel.uncompletedTasks;
      expect(uncompletedTasks.length, 2);
    });

    test("should return correct count of uncompleted tasks", () {
      final uncompletedTasksCount = todoTaskViewModel.uncompletedTasksCount;
      expect(uncompletedTasksCount, 2);
    });

    test("should toggle task as done", () async {
      final firstTaskKey = todoTaskViewModel.uncompletedTasks.keys.first;
      todoTaskViewModel.toggleTaskDone(firstTaskKey);

      final updateTask = taskBox.get(firstTaskKey);
      expect(updateTask!.isDone, true);
      expect(todoTaskViewModel.uncompletedTasksCount, 1);
    });

    test("should notify listeners when tasks are updated", () {
      bool isNotified = false;
      todoTaskViewModel.addListener(() {
        isNotified = true;
      });

      final firstTaskKey = todoTaskViewModel.uncompletedTasks.keys.first;
      todoTaskViewModel.toggleTaskDone(firstTaskKey);

      expect(isNotified, true);
    });
  });
}
