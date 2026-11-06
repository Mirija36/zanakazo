import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/enums.dart';
import '../domain/models/models.dart' as domain;
import 'core_providers.dart';

// =========================================================================
// Lecture (streams réactifs, pour que les écrans se mettent à jour tout
// seuls dès qu'une complétion est cochée ou qu'une habitude est modifiée)
// =========================================================================
final habitudesActivesProvider = StreamProvider<List<domain.Habit>>((ref) {
  return ref.watch(habitRepositoryProvider).watchHabitudeActives();
});

final habitudeProvider = StreamProvider.family<domain.Habit?, String>((
  ref,
  habitudeId,
) {
  return ref.watch(habitRepositoryProvider).watchHabitude(habitudeId);
});

final planteProvider = StreamProvider.family<domain.Plante?, String>((
  ref,
  habitudeId,
) {
  return ref.watch(planteRepositoryProvider).watchPlante(habitudeId);
});

final completionsProvider =
    StreamProvider.family<List<domain.Completion>, String>((ref, habitudeId) {
      return ref
          .watch(completionRepositoryProvider)
          .watchCompletions(habitudeId);
    });

/// Dérivé de [completionsProvider] : vrai si l'habitude a déjà une
/// complétion "fait" pour aujourd'hui — utile pour l'état de la case à
/// cocher sur l'écran "Aujourd'hui" sans refaire une requête dédiée.
final estCompleteAujourdHuiProvider = Provider.family<bool, String>((
  ref,
  habitudeId,
) {
  final completions = ref.watch(completionsProvider(habitudeId));
  final aujourdHui = DateTime.now();
  final aujourdHuiNormalise = DateTime(
    aujourdHui.year,
    aujourdHui.month,
    aujourdHui.day,
  );
  return completions.maybeWhen(
    data: (liste) => liste.any(
      (c) => c.date == aujourdHuiNormalise && c.statut == StatutCompletion.fait,
    ),
    orElse: () => false,
  );
});

// =========================================================================
// Écriture (actions appelées depuis les écrans)
// =========================================================================
final habitudeActionsProvider = Provider<HabitActions>((ref) {
  return HabitActions(ref);
});

class HabitActions {
  HabitActions(this._ref);
  final Ref _ref;

  /// Crée l'habitude et sa plante par défaut (voir
  /// `HabitRepository.creerHabitudeAvecPlante`).
  Future<void> creerHabitude(domain.Habit habitude) {
    return _ref.read(habitRepositoryProvider).creerHabitudeAvecPlante(habitude);
  }

  Future<void> modifierHabitude(domain.Habit habitude) {
    return _ref.read(habitRepositoryProvider).modifierHabitude(habitude);
  }

  /// Archive sans supprimer (`actif = false`) — utilisé par le bouton
  /// "Archiver" de l'écran de détail, à préférer à la suppression.
  Future<void> archiverHabitude(String habitudeId) {
    return _ref.read(habitRepositoryProvider).archiveHabitude(habitudeId);
  }

  Future<void> reactiverHabitude(String habitudeId) {
    return _ref.read(habitRepositoryProvider).reactiverHabitudes(habitudeId);
  }

  /// Suppression définitive — supprime en cascade sa plante, ses
  /// complétions et ses reminders.
  Future<void> supprimerHabitude(String habitudeId) {
    return _ref.read(habitRepositoryProvider).supprimerHabitude(habitudeId);
  }

  /// Coche/décoche une habitude pour une date donnée (par défaut
  /// aujourd'hui). N'avance PAS le streak elle-même : c'est le
  /// `StreakEngine`, exécuté au prochain passage de minuit via
  /// `startup_provider.dart`, qui lira cette complétion et mettra à jour
  /// la plante en conséquence.
  Future<void> marquerStatut({
    required String habitudeId,
    DateTime? date,
    required StatutCompletion statut,
  }) {
    return _ref
        .read(completionRepositoryProvider)
        .marquerStatut(
          habitudeId: habitudeId,
          date: date ?? DateTime.now(),
          statut: statut,
        );
  }
}
