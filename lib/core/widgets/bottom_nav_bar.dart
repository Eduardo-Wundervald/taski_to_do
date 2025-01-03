import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int)? onTabChange;

  const MyBottomNavBar({
    super.key,
    required this.onTabChange,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: Icons.format_list_bulleted,
            label: "Todo",
            index: 0,
            currentIndex: currentIndex,
            onTap: onTabChange,
          ),
          _buildNavItem(
            icon: Icons.add_circle_outline,
            label: "Create",
            index: 1,
            currentIndex: currentIndex,
            onTap: onTabChange,
          ),
          _buildNavItem(
            icon: Icons.search,
            label: "Search",
            index: 2,
            currentIndex: currentIndex,
            onTap: onTabChange,
          ),
          _buildNavItem(
            icon: Icons.check_circle_outline,
            label: "Done",
            index: 3,
            currentIndex: currentIndex,
            onTap: onTabChange,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required int currentIndex,
    required void Function(int)? onTap,
  }) {
    final isSelected = index == currentIndex;

    return GestureDetector(
      onTap: () => onTap?.call(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected
                ? const Color.fromRGBO(0, 172, 255, 1)
                : const Color.fromRGBO(198, 207, 220, 1),
            size: 28,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected
                  ? const Color.fromRGBO(0, 172, 255, 1)
                  : const Color.fromRGBO(198, 207, 220, 1),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
