import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taski_to_do/src/presentation/viewmodel/bottom_bar_view_model.dart';

import '../../../core/widgets/bottom_nav_bar.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BottomBarViewModel>();

    return Scaffold(
      body: viewModel.currentScreen,
      bottomNavigationBar: MyBottomNavBar(
        currentIndex: viewModel.currentIndex,
        onTabChange: viewModel.onTabChange,
      ),
    );
  }
}
