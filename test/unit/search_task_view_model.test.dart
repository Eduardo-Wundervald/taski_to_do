import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/hive_test.dart';
import 'package:taski_to_do/src/data/model/task.dart';
import 'package:taski_to_do/src/presentation/viewmodel/search_task_view_model.dart';

void main() {
  group("SearchViewModel Test", () {
    late Box<Task> taskBox;
    late SearchTaskViewModel searchTaskViewModel;

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
      await taskBox.add(
          Task(title: "Task 4", description: "Description 4", isDone: false));

      searchTaskViewModel = SearchTaskViewModel(taskBox: taskBox);
    });

    tearDown(() async {
      await taskBox.clear();
      await taskBox.close();
      await tearDownTestHive();
    });

    test("should return all tasks containing query in title", () {
      searchTaskViewModel.searchTask("Task");

      final filteredTasks = searchTaskViewModel.filteredTasks;

      expect(filteredTasks.length, 4);
      expect(
          filteredTasks.every((task) =>
              task.title.contains("Task") || task.description.contains("Task")),
          true);
    });

    test("should return tasks regardless of case sensitivity", () {
      searchTaskViewModel.searchTask("task");
      final filteredTasks = searchTaskViewModel.filteredTasks;

      expect(filteredTasks.length, 4);
    });

    test("should return all tasks containing query in subtitle", () {
      searchTaskViewModel.searchTask("Description");

      final filteredTasks = searchTaskViewModel.filteredTasks;
      expect(filteredTasks.length, 4);
      expect(
          filteredTasks.every((task) =>
              task.title.contains("Description") ||
              task.description.contains("Description")),
          true);
    });

    test("should return tasks that match the specific query", () {
      searchTaskViewModel.searchTask("Task 1");

      final filteredTasks = searchTaskViewModel.filteredTasks;
      expect(filteredTasks.length, 1);
      expect(filteredTasks.first.title, "Task 1");
    });

    test("should return empty list of filtered task when query is empty", () {
      searchTaskViewModel.searchTask("");

      final filteredTasks = searchTaskViewModel.filteredTasks;

      expect(filteredTasks.length, 0);
      expect(filteredTasks.isEmpty, true);
    });

    test("should return no tasks if query doesn't match", () {
      searchTaskViewModel.searchTask("NonExistentTask");
      final filteredTasks = searchTaskViewModel.filteredTasks;

      expect(filteredTasks.length, 0);
      expect(filteredTasks.isEmpty, true);
    });
  });
}
