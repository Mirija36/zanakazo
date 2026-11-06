import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Coque commune aux 4 onglets principaux. Chaque onglet garde son propre
/// état de navigation (StatefulShellRoute) : revenir sur « Jardin » retrouve
/// l'écran où on l'avait laissé.

class BottomNavShell extends StatelessWidget {
  const BottomNavShell({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.local_florist_outlined),
            selectedIcon: Icon(Icons.local_florist),
            label: 'Aujourd\'hui',
          ),
          NavigationDestination(
            icon: Icon(Icons.park_outlined),
            selectedIcon: Icon(Icons.park),
            label: 'Jardin',
          ),
          NavigationDestination(
            icon: Icon(Icons.tune_outlined),
            selectedIcon: Icon(Icons.tune),
            label: 'Réglages',
          ),
        ],
      ),
    );
  }
}
