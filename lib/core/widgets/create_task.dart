import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../src/presentation/viewmodel/create_task_view_model.dart';
import '../../src/presentation/viewmodel/todo_task_view_model.dart';

class CreateTask extends StatelessWidget {
  CreateTask({super.key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: "What’s in your mind?",
                    labelStyle: const TextStyle(
                      color: Color.fromRGBO(141, 156, 184, 1),
                      fontFamily: "Urbanist",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(
                      Icons.check_box_outline_blank_outlined,
                      color: Color.fromRGBO(198, 207, 220, 1),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: "Add a note...",
                    labelStyle: const TextStyle(
                      color: Color.fromRGBO(141, 156, 184, 1),
                      fontFamily: "Urbanist",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(
                      Icons.edit,
                      color: Color.fromRGBO(198, 207, 220, 1),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    onPressed: () {
                      final createTaskViewModel =
                          Provider.of<CreateTaskViewModel>(context,
                              listen: false);
                      final todoTaskViewModel = Provider.of<TodoTaskViewModel>(
                          context,
                          listen: false);

                      createTaskViewModel.createTask(titleController.text,
                          descriptionController.text, todoTaskViewModel);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Create",
                      style: TextStyle(
                        color: Color.fromRGBO(0, 127, 255, 1),
                        fontFamily: "Urbanist",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
