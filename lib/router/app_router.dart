import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../presentation/home/home_screen.dart';
import '../presentation/habit/create_habit_screen.dart';
import '../presentation/widgets/bottom_nav_shell.dart';
import '../presentation/widgets/ecran_a_venir.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

/// Déclaré comme provider (plutôt qu'un simple `GoRouter` global) pour
/// pouvoir plus tard lui faire écouter d'autres providers (ex. rediriger
/// vers `/onboarding` tant qu'il n'a pas été complété).
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            BottomNavShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                name: 'aujourdhui',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/jardin',
                name: 'jardin',
                builder: (context, state) => const EcranAVenir(
                  titre: 'Mon Jardin',
                  icone: Icons.park_outlined,
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/stats',
                name: 'stats',
                builder: (context, state) => const EcranAVenir(
                  titre: 'Statistiques',
                  icone: Icons.wb_sunny_outlined,
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/reglages',
                name: 'reglages',
                builder: (context, state) => const EcranAVenir(
                  titre: 'Réglages',
                  icone: Icons.tune_outlined,
                ),
              ),
            ],
          ),
        ],
      ),

      // Plein écran, par-dessus la barre du bas : on passe par le navigator
      // racine, sinon l'écran s'ouvrirait à l'intérieur de l'onglet.
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/habitudes/nouvelle',
        name: 'creerHabitude',
        builder: (context, state) => const CreateHabitScreen(),
      ),

      // À ajouter plus tard (aussi avec parentNavigatorKey: _rootNavigatorKey) :
      // /habitudes/:id (détail), /especes/:id (guide), /onboarding
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page introuvable : ${state.uri}'))),
  );
});
