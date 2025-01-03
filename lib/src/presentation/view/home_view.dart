import 'package:flutter/material.dart';
import 'package:taski_to_do/core/widgets/bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import '../viewmodel/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    return Scaffold(
      body: const Center(
        child: Text('Todo View'),
      ),
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: viewModel.onTabChange,
        currentIndex: viewModel.currentIndex,
      ),
    );
  }
}
