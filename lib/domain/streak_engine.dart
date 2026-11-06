import '../data/repositories.dart';
import 'models/enums.dart';
import 'models/models.dart' as domain;

/// Implémente la machine à états de la plante (section 4 de la feuille de
/// route) et le rattrapage des jours manqués (section 5).

/// Les deux transitions (`appliquerCompletion` / `appliquerJourManque`)
/// sont des fonctions statiques pures — aucune dépendance à la base de
/// données — pour pouvoir être testées directement dans
/// `test/streak_engine_test.dart` sans AppDatabase ni repository.
class StreakEngine {
  StreakEngine(this._completionRepository, this._planteRepository);
  final CompletionRepository _completionRepository;
  final PlanteRepository _planteRepository;

  // -----------------------------------------------------------------------
  // Transitions pures (section 4)
  // -----------------------------------------------------------------------

  /// Jour complété : streak +1, vitalité +25 (plafonnée à 100), plus aucun
  /// jour manqué, stade recalculé côté domaine à partir du nouveau streak
  /// (voir `Plante.stade`, dérivé — jamais stocké).
  static domain.Plante appliquerCompletion(domain.Plante plante) {
    final nouveauStreak = plante.streakActuel + 1;
    return plante.copyWith(
      joursManquesConsecutifs: 0,
      streakActuel: nouveauStreak,
      meilleurStreak: nouveauStreak > plante.meilleurStreak
          ? nouveauStreak
          : plante.meilleurStreak,
      vitalite: _clamp(plante.vitalite + 25, 0, 100),
    );
  }

  /// Jour manqué : streak remis à 0, vitalité -25 (plancher 0), un jour
  /// manqué de plus — sauf si ça atteint le seuil de mort
  /// ([VitalityState.joursAvantMort], 4), auquel cas reset complet
  /// (nouvelle graine, vitalité 100, plus aucune trace de fanaison).
  /// `meilleurStreak` n'est jamais réinitialisé : c'est un record
  /// historique.
  static domain.Plante appliquerJourManque(domain.Plante plante) {
    final joursManques = plante.joursManquesConsecutifs + 1;

    if (joursManques >= VitalityState.joursAvantMort) {
      return plante.copyWith(
        streakActuel: 0,
        joursManquesConsecutifs: 0,
        vitalite: 100,
      );
    }

    return plante.copyWith(
      streakActuel: 0,
      joursManquesConsecutifs: joursManques,
      vitalite: _clamp(plante.vitalite - 25, 0, 100),
    );
  }

  static int _clamp(int valeur, int min, int max) {
    if (valeur < min) return min;
    if (valeur > max) return max;
    return valeur;
  }

  // -----------------------------------------------------------------------
  // Orchestration (section 5)
  // -----------------------------------------------------------------------

  /// Traite une habitude pour un jour donné : regarde si elle a été
  /// complétée ce jour-là, applique la transition correspondante à sa
  /// plante et persiste le résultat.
  ///
  /// Ne fait rien si l'habitude n'était pas prévue ce jour-là (fréquence
  /// "jours spécifiques", voir `Habit.estPrevuePour`) : un jour non prévu
  /// n'est jamais un jour manqué.
  Future<void> traiterJourPourHabitude({
    required domain.Habit habitude,
    required DateTime date,
  }) async {
    final creation = DateTime(
      habitude.dateCreation.year,
      habitude.dateCreation.month,
      habitude.dateCreation.day,
    );
    if (date.isBefore(creation)) return;

    if (!habitude.estPrevuePour(date)) return;

    final plante = await _planteRepository.obtenirPlante(habitude.id);
    if (plante == null) return; // ne devrait pas arriver (relation 1-1)

    final completion = await _completionRepository.completionPour(
      habitude.id,
      date,
    );
    final fait = completion?.statut == StatutCompletion.fait;

    final nouvellePlante = fait
        ? appliquerCompletion(plante)
        : appliquerJourManque(plante);

    await _planteRepository.mettreAJourPlante(nouvellePlante);
  }

  /// Rattrape tous les jours entre `derniereDate` (exclue, déjà traitée la
  /// dernière fois) et `aujourdHui` (exclu : le jour courant n'est clos
  /// qu'à minuit suivant, donc pas encore à traiter), pour chaque habitude
  /// active fournie.
  ///
  /// Appelée par `providers/startup_provider.dart` à l'ouverture de l'app,
  /// avec `derniereDate` lue depuis `Parametres['derniere_date_calculee']`.
  Future<void> rattraperJour({
    required List<domain.Habit> habitudesActives,
    required DateTime derniereDate,
    required DateTime aujourdHui,
  }) async {
    var jour = _normaliser(derniereDate).add(const Duration(days: 1));
    final limite = _normaliser(aujourdHui);

    while (jour.isBefore(limite)) {
      for (final habitude in habitudesActives) {
        await traiterJourPourHabitude(habitude: habitude, date: jour);
      }
      jour = jour.add(const Duration(days: 1));
    }
  }

  DateTime _normaliser(DateTime date) =>
      DateTime(date.year, date.month, date.day);
}
