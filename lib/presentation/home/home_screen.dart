import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';

import '../../domain/models/enums.dart';
import '../../domain/models/models.dart' as domain;
import '../../providers/habit_providers.dart';
import '../../providers/startup_provider.dart';
import '../../theme/app_theme.dart';

/// Écran "Aujourd'hui" (Sprint 1) : liste des habitudes actives avec une
/// case à cocher pour marquer le jour comme fait/manqué. Le reste de la
/// plante (vitalité, stade) n'avance qu'au prochain lancement après minuit
/// (voir StreakEngine, section 5 de la feuille de route) — cocher ici
/// n'anime donc rien dans l'immédiat, c'est volontaire.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final demarrage = ref.watch(startupProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Aujourd\'hui')),
      body: demarrage.when(
        data: (_) => const _ListeHabitudes(),
        error: (erreur, _) => _ErreurDemarrage(erreur: erreur),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.pushNamed('creerHabitude'),
        icon: const Icon(Icons.add),
        label: const Text('Planter'),
      ),
    );
  }
}

class _ErreurDemarrage extends StatelessWidget {
  const _ErreurDemarrage({required this.erreur});
  final Object erreur;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          'Une erreur est survenue au démarrage : \n$erreur',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _ListeHabitudes extends ConsumerWidget {
  const _ListeHabitudes();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habitudes = ref.watch(habitudesActivesProvider);
    final spacing =
        Theme.of(context).extension<AppSpacing>() ?? const AppSpacing();

    return habitudes.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (erreur, _) => Center(child: Text('Erreur : $erreur')),
      data: (liste) {
        if (liste.isEmpty) {
          return const _AucuneHabitude();
        }
        return ListView.separated(
          padding: EdgeInsets.all(spacing.marginMobile),
          itemCount: liste.length,
          separatorBuilder: (_, _) => SizedBox(height: spacing.md),
          itemBuilder: (context, index) => _HabitCard(habitude: liste[index]),
        );
      },
    );
  }
}

class _AucuneHabitude extends StatelessWidget {
  const _AucuneHabitude();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.eco_outlined, size: 48),
            const SizedBox(height: 12),
            Text(
              'Aucune habitude pour l\'instant',
              style: textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Plante ta première graine pour commencer.',
              style: textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _HabitCard extends ConsumerWidget {
  const _HabitCard({required this.habitude});
  final domain.Habit habitude;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plante = ref.watch(planteProvider(habitude.id));
    final estComplete = ref.watch(estCompleteAujourdHuiProvider(habitude.id));
    final theme = Theme.of(context);
    final spacing = theme.extension<AppSpacing>() ?? const AppSpacing();

    return Card(
      child: Padding(
        padding: EdgeInsets.all(spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Chip(label: Text(habitude.especeNom)),
                SizedBox(width: spacing.xs),
                Chip(label: Text(habitude.categorie.label)),
                const Spacer(),
                plante.maybeWhen(
                  data: (p) => p == null
                      ? const SizedBox.shrink()
                      : _StreakBadge(jours: p.streakActuel),
                  orElse: () => const SizedBox.shrink(),
                ),
              ],
            ),
            SizedBox(height: spacing.sm),
            Text(habitude.nom, style: theme.textTheme.headlineSmall),
            SizedBox(height: spacing.xs),
            plante.maybeWhen(
              data: (p) => p == null
                  ? const SizedBox.shrink()
                  : Text(
                      'Stade : ${p.stade.label} · ${p.vitaliteEtat.label}',
                      style: theme.textTheme.bodySmall,
                    ),
              orElse: () => const SizedBox.shrink(),
            ),
            SizedBox(height: spacing.md),
            Align(
              alignment: Alignment.centerRight,
              child: estComplete
                  ? OutlinedButton.icon(
                      onPressed: () => _basculer(ref, estComplete: true),
                      icon: const Icon(Icons.check_circle_outline),
                      label: const Text('Arrosée'),
                    )
                  : ElevatedButton.icon(
                      onPressed: () => _basculer(ref, estComplete: false),
                      icon: const Icon(Icons.water_drop_outlined),
                      label: const Text('Arroser'),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  /// Coche ou décoche l'habitude pour aujourd'hui. `marquerStatut` fait
  /// l'upsert : repasser sur "manque" annule simplement la complétion du
  /// jour plutôt que de la supprimer en base.
  void _basculer(WidgetRef ref, {required bool estComplete}) {
    ref
        .read(habitudeActionsProvider)
        .marquerStatut(
          habitudeId: habitude.id,
          statut: estComplete ? StatutCompletion.manque : StatutCompletion.fait,
        );
  }
}

class _StreakBadge extends StatelessWidget {
  const _StreakBadge({required this.jours});
  final int jours;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.local_fire_department,
          size: 16,
          color: colorScheme.tertiary,
        ),
        const SizedBox(width: 2),
        Text('$jours j', style: Theme.of(context).textTheme.labelMedium),
      ],
    );
  }
}

/// Formate une date au format "jeudi 24 octobre" — gardé ici pour un futur
/// en-tête (voir maquette), pas encore utilisé par cette version minimale
/// de l'écran.
String formaterDateDuJour(DateTime date) {
  return DateFormat.yMMMMEEEEd('fr_FR').format(date);
}
