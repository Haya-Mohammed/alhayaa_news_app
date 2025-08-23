import 'package:flutter/material.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.shifting,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.travel_explore), label: 'Explore'),
        BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border), label: 'Saved'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined), label: 'Settings'),
      ],
    );
  }
}
