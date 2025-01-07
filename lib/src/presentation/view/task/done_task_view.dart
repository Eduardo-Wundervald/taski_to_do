import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/logo.dart';
import '../../../../core/widgets/profile.dart';
import '../../../../core/widgets/view_task.dart';
import '../../viewmodel/done_task_view_model.dart';

class DoneTask extends StatelessWidget {
  const DoneTask({super.key});

  @override
  Widget build(BuildContext context) {
    final doneTaskViewModel = context.watch<DoneTaskViewModel>();
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
          children: [
            Row(
              children: [
                const Text(
                  "Completed Tasks",
                  style: TextStyle(
                    color: Color.fromRGBO(63, 61, 86, 1),
                    fontFamily: "Urbanist",
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                const Spacer(),

                // Clear All
                TextButton(
                  onPressed: () => doneTaskViewModel.deleteAllTaskDone(),
                  child: const Text(
                    "Delete All",
                    style: TextStyle(
                      color: Color.fromRGBO(255, 94, 94, 1),
                      fontFamily: "Urbanist",
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            doneTaskViewModel.completedTasks.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "No tasks completed yet.",
                        style: TextStyle(
                          color: Color.fromRGBO(141, 156, 184, 1),
                          fontFamily: "Urbanist",
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: doneTaskViewModel.completedTasks.length,
                      itemBuilder: (context, index) {
                        final taskKey = doneTaskViewModel.completedTasks.keys
                            .elementAt(index);
                        final task = doneTaskViewModel.completedTasks[taskKey]!;
                        return ViewTask(
                          title: task.title,
                          description: task.description,
                          isDone: task.isDone,
                          onTaskDone: (value) {
                            doneTaskViewModel.toggleTaskUndone(taskKey);
                          },
                          onDelete: () {
                            doneTaskViewModel.deleteTask(taskKey);
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
