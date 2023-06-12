import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;
  const CustomBottomNavigation({super.key, required this.currentIndex});

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      case 2:
        context.go('/home/2');
        break;
      default:
        context.go('/home/0');
    }
    // context.go('');
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) => onItemTapped(context, value),
      elevation: 0,
      selectedItemColor: colors.primary,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.all_inclusive_outlined), label: 'Inicio'),
        BottomNavigationBarItem(
            icon: Icon(Icons.rocket_launch_outlined), label: 'Populares'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline), label: 'Favoritos'),
      ],
    );
  }
}
