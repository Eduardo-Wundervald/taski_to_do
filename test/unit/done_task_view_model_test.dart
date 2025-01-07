import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/hive_test.dart';
import 'package:taski_to_do/src/data/model/task.dart';
import 'package:taski_to_do/src/presentation/viewmodel/done_task_view_model.dart';

void main() {
  group("DoneTaskViewModel Test", () {
    //set up
    late Box<Task> taskBox;
    late DoneTaskViewModel doneTaskViewModel;

    setUp(() async {
      await setUpTestHive();
      if (!Hive.isAdapterRegistered(0)) {
        Hive.registerAdapter(TaskAdapter());
      }
      taskBox = await Hive.openBox<Task>("taskTest");

      await taskBox.add(
          Task(title: "Task 1", description: "Description 1", isDone: true));
      await taskBox.add(
          Task(title: "Task 2", description: "Description 2", isDone: true));
      await taskBox.add(
          Task(title: "Task 3", description: "Description 3", isDone: false));

      doneTaskViewModel = DoneTaskViewModel(taskBox: taskBox);
    });

    tearDown(() async {
      await taskBox.clear();
      await taskBox.close();
      await tearDownTestHive();
    });

    test("should return only done tasks", () {
      final completedTasks = doneTaskViewModel.completedTasks;

      expect(completedTasks.length, 2);
    });

    test("should return correct count on done tasks", () {
      final completedTasksCount = doneTaskViewModel.completedTasksCount;

      expect(completedTasksCount, 2);
    });

    test("should toogle task as undone", () {
      final secondTaskKey = doneTaskViewModel.completedTasks.keys.first;
      doneTaskViewModel.toggleTaskUndone(secondTaskKey);

      final updateTask = taskBox.get(secondTaskKey);

      expect(updateTask!.isDone, false);
      expect(doneTaskViewModel.completedTasksCount, 1);
    });
    test("should delete one task done", () {
      final secondTaskKey = doneTaskViewModel.completedTasks.keys.first;
      doneTaskViewModel.deleteTask(secondTaskKey);

      final deletedTask = taskBox.get(secondTaskKey);

      expect(deletedTask, null);

      expect(doneTaskViewModel.completedTasksCount, 1);
    });

    test("should delete all done tasks", () {
      //check done tasks
      expect(doneTaskViewModel.completedTasksCount, 2);

      //delete all done tasks
      doneTaskViewModel.deleteAllTasksDone();

      //check done tasks
      expect(doneTaskViewModel.completedTasksCount, 0);
    });
  });
}
