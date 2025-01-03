import 'package:flutter/material.dart';
import 'package:taski_to_do/src/presentation/view/home_view.dart';

class HomeViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final List<Widget> screens = [
    const HomeView(),
  ];

  Widget get currentScreen => screens[_currentIndex];

  void onTabChange(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
