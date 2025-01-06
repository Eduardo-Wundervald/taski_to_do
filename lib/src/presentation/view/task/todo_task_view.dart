import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taski_to_do/src/presentation/viewmodel/todo_task_view_model.dart';

import '../../../../core/widgets/create_task.dart';
import '../../../../core/widgets/logo.dart';
import '../../../../core/widgets/profile.dart';
import '../../../../core/widgets/view_task.dart';

class TodoTask extends StatelessWidget {
  const TodoTask({super.key});

  @override
  Widget build(BuildContext context) {
    final taskViewModel = context.watch<TodoTaskViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 20, left: 8, right: 8),
          child: Row(
            children: [
              Logo(),
              Spacer(),
              Profile(name: "John"),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 26, right: 26, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome, John.
            const Text.rich(
              TextSpan(
                text: "Welcome,",
                style: TextStyle(
                  color: Color.fromRGBO(63, 61, 86, 1),
                  fontFamily: "Urbanist",
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
                children: [
                  TextSpan(
                    text: " John",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 172, 255, 1),
                      fontFamily: "Urbanist",
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  TextSpan(
                    text: ".",
                    style: TextStyle(
                      color: Color.fromRGBO(63, 61, 86, 1),
                      fontFamily: "Urbanist",
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            //empty task
            taskViewModel.task.isEmpty
                ? const Text(
                    "You have no task listed.",
                    style: TextStyle(
                      color: Color.fromRGBO(141, 156, 184, 1),
                      fontFamily: "Urbanist",
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  )
                : Text(
                    "You’ve got ${taskViewModel.taskCount} tasks to do.",
                    style: const TextStyle(
                      color: Color.fromRGBO(141, 156, 184, 1),
                      fontFamily: "Urbanist",
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(245, 247, 249, 1),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            // Task List empty
            if (taskViewModel.task.isEmpty)
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Image(
                        image: AssetImage("assets/images/no_result.png"),
                        width: 82,
                        height: 80,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "You have no task listed.",
                        style: TextStyle(
                          color: Color.fromRGBO(141, 156, 184, 1),
                          fontFamily: "Urbanist",
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          //modal
                          showModalBottomSheet(
                            context: context,
                            barrierColor: Colors.black.withOpacity(0.5),
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(24),
                              ),
                            ),
                            builder: (BuildContext context) {
                              return const CreateTask();
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(0, 127, 255, 0.1),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.add,
                              color: Color.fromRGBO(0, 127, 255, 1),
                            ),
                            SizedBox(width: 4),
                            Text(
                              "Create Task",
                              style: TextStyle(
                                color: Color.fromRGBO(0, 127, 255, 1),
                                fontFamily: "Urbanist",
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: taskViewModel.task.length,
                itemBuilder: (context, index) {
                  return ViewTask(
                    title: taskViewModel.task[index].title,
                    description: taskViewModel.task[index].description,
                    isDone: taskViewModel.task[index].isDone,
                    onTaskDone: (value) {
                      taskViewModel.toogleTaskDone(index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
