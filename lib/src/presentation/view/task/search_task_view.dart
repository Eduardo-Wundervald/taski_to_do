import 'package:flutter/material.dart';

import '../../../../core/widgets/logo.dart';
import '../../../../core/widgets/profile.dart';

class SearchTask extends StatelessWidget {
  SearchTask({super.key});

  //controller
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                print(value);
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
        ],
      ),
    );
  }
}
