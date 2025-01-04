import 'package:flutter/material.dart';

import '../../../../core/widgets/logo.dart';
import '../../../../core/widgets/profile.dart';

class TodoTask extends StatelessWidget {
  const TodoTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Logo(),
            Spacer(),
            Profile(name: "John"),
          ],
        ),
      ),
      body: Text("Todo Task"),
    );
  }
}
