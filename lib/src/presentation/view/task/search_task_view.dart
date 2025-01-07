import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/logo.dart';
import '../../../../core/widgets/profile.dart';
import '../../../../core/widgets/view_task.dart';
import '../../viewmodel/search_task_view_model.dart';

class SearchTask extends StatelessWidget {
  SearchTask({super.key});

  //controller
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final searchViewModel = context.watch<SearchTaskViewModel>();
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                searchViewModel.searchTask(value);
              },
              decoration: InputDecoration(
                fillColor: const Color.fromRGBO(245, 247, 249, 1),
                filled: true,
                prefixIcon: const Icon(Icons.search, color: Colors.blue),
                suffixIcon: GestureDetector(
                  onTap: () {
                    _searchController.clear();
                  },
                  child: const Icon(
                    Icons.cancel,
                    color: Colors.blue,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.grey[400]!),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
          ),
          Expanded(
            child: searchViewModel.filteredTasks.isEmpty
                ? const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage('assets/images/no_result.png')),
                      Text(
                        'No result found.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView.builder(
                      itemCount: searchViewModel.filteredTasks.length,
                      itemBuilder: (context, index) {
                        final taskKey = searchViewModel.taskBox.keys
                            .elementAt(index) as int;
                        final task = searchViewModel.filteredTasks[index];
                        return ViewTask(
                          title: task.title,
                          description: task.description,
                          isDone: task.isDone,
                          onTaskDone: (value) {
                            searchViewModel.changeTaskState(task);
                          },
                          onDelete: () => searchViewModel.deleteTask(taskKey),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
