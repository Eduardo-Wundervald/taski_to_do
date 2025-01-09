import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/hive_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:taski_to_do/src/data/model/task.dart';
import 'package:taski_to_do/src/presentation/viewmodel/create_task_view_model.dart';
import 'package:taski_to_do/src/presentation/viewmodel/todo_task_view_model.dart';

import 'create_task_view_model_test.mocks.dart';

@GenerateMocks([TodoTaskViewModel])
void main() {
  late Box<Task> taskBox;
  late CreateTaskViewModel createTaskViewModel;
  late MockTodoTaskViewModel mockTodoTaskViewModel;

  setUp(() async {
    await setUpTestHive();
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(TaskAdapter());
    }
    taskBox = await Hive.openBox<Task>("taskTest");

    createTaskViewModel = CreateTaskViewModel(taskBox: taskBox);
    mockTodoTaskViewModel = MockTodoTaskViewModel();
  });

  tearDown(() async {
    await taskBox.clear();
    await taskBox.close();
    await tearDownTestHive();
  });

  test("should create a new task", () {
    createTaskViewModel.createTask(
        "Task 1", "Description", mockTodoTaskViewModel);

    final tasks = taskBox.values.toList();
    expect(tasks.length, 1);
    expect(tasks.first.title, "Task 1");
    expect(tasks.first.description, "Description");

    verify(mockTodoTaskViewModel.notifyTasksUpdated()).called(1);
  });

  test("should not create a task with an empty title", () {
    createTaskViewModel.createTask("", "Description", mockTodoTaskViewModel);

    final tasks = taskBox.values.toList();
    expect(tasks.isEmpty, true);
  });
}
